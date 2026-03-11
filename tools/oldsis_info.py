#!/usr/bin/env python3
"""
oldsis_info.py - inspect classic (pre-Symbian OS 9.1) SIS files

What it does:
- Parses the classic SIS/EPOC header
- Lists metadata: UIDs, version, options, type, installer version, pointers
- Lists languages
- Lists component names
- Lists file records, including source/destination, type, sizes, offsets
- Lists requisites (dependencies)
- Reads certificates record timestamp if present
- Optionally tries to extract file payloads

What it does NOT do perfectly:
- Full symbolic evaluation of IF / ELSEIF expressions
- Perfect decoding of every obscure file-details bitfield
- New SISX format (Symbian OS 9.1+)

Usage:
    python oldsis_info.py sample.sis
    python oldsis_info.py sample.sis --json
    python oldsis_info.py sample.sis --extract outdir
"""

from __future__ import annotations

import argparse
import json
import struct
import sys
import zlib
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Any, Optional

# ---------- basic helpers ----------

def u16(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]

def u32(data: bytes, off: int) -> int:
    return struct.unpack_from("<I", data, off)[0]

def safe_slice(data: bytes, off: int, size: int) -> bytes:
    if off < 0 or size < 0 or off + size > len(data):
        raise ValueError(f"out of bounds: off=0x{off:x} size=0x{size:x}")
    return data[off:off + size]

def fmt_uid(x: int) -> str:
    return f"0x{x:08X}"

def looks_utf16le_string_blob(blob: bytes) -> bool:
    # Classic SIS strings are generally stored as UTF-16LE/UCS-2-ish data.
    if len(blob) < 2 or (len(blob) % 2) != 0:
        return False
    zero_hi = 0
    checked = min(len(blob) // 2, 64)
    for i in range(checked):
        ch = blob[2 * i + 1]
        if ch == 0:
            zero_hi += 1
    return checked > 0 and (zero_hi / checked) > 0.6

def read_probable_string(data: bytes, ptr: int, length: int) -> str:
    blob = safe_slice(data, ptr, length)
    # Try UTF-16LE first if plausible, else latin-1 fallback
    if looks_utf16le_string_blob(blob):
        try:
            return blob.decode("utf-16le", errors="replace")
        except Exception:
            pass
    try:
        return blob.decode("latin-1", errors="replace")
    except Exception:
        return blob.hex()

def mkdirp(p: Path) -> None:
    p.mkdir(parents=True, exist_ok=True)

# ---------- mappings ----------

LANG_CODES = {
    0x0000: "Test",
    0x0001: "UK English",
    0x0002: "French",
    0x0003: "German",
    0x0004: "Spanish",
    0x0005: "Italian",
    0x0006: "Swedish",
    0x0007: "Danish",
    0x0008: "Norwegian",
    0x0009: "Finnish",
    0x000A: "American English",
    0x000B: "Swiss French",
    0x000C: "Swiss German",
    0x000D: "Portuguese",
    0x000E: "Turkish",
    0x000F: "Icelandic",
    0x0010: "Russian",
    0x0011: "Hungarian",
    0x0012: "Dutch",
    0x0013: "Belgian Flemish",
    0x0014: "Australian English",
    0x0015: "Belgian French",
    0x0016: "Austrian German",
    0x0017: "New Zealand English",
    0x0018: "International French",
    0x0019: "Czech",
    0x001A: "Slovak",
    0x001B: "Polish",
    0x001C: "Slovenian",
    0x001D: "Taiwan Chinese",
    0x001E: "Hong Kong Chinese",
    0x001F: "PRC Chinese",
    0x0020: "Japanese",
    0x0021: "Thai",
    0x0022: "Afrikaans",
    0x0054: "Swahili",
    0x0055: "Finland Swedish",
    0x0057: "Tamil",
    0x0058: "Telugu",
    0x0059: "Tibetan",
    0x005A: "Tigrinya",
    0x005B: "Cyprus Turkish",
    0x005C: "Turkmen",
    0x005D: "Ukrainian",
    0x005E: "Urdu",
    0x0060: "Vietnamese",
    0x0061: "Welsh",
    0x0062: "Zulu",
}

FILE_RECORD_TYPES = {
    0: "Simple file line",
    1: "Multiple language files line",
    2: "Options line",
    3: "If line",
    4: "ElseIf line",
    5: "Else line",
    6: "EndIf line",
}

FILE_TYPES = {
    0: "FILE",
    1: "FILETEXT",
    2: "Embedded SIS component",
    3: "FILERUN",
    4: "FILENULL",
    5: "FILEMIME",
}

PACKAGE_TYPES = {
    0: "unspecified/unknown",
    1: "application-ish",
}

HEADER_OPTIONS_BITS = {
    0x0001: "IsUnicode",
    0x0002: "DistributeIfNoDrive",
    0x0008: "NoCompress?",
}

# ---------- data classes ----------

@dataclass
class Header:
    uid1: int
    uid2: int
    uid3: int
    uid4: int
    checksum: int
    num_languages: int
    num_files: int
    num_requisites: int
    installation_language: int
    installation_files: int
    installation_drive: int
    num_capabilities: int
    installer_version: int
    options: int
    type: int
    major: int
    minor: int
    variant: int
    languages_ptr: int
    files_ptr: int
    requisites_ptr: int
    certificates_ptr: int
    component_name_ptr: int
    # ER6 extension
    signature_ptr: Optional[int] = None
    capabilities_ptr: Optional[int] = None
    installed_space: Optional[int] = None
    max_installed_space: Optional[int] = None
    reserved: Optional[bytes] = None
    is_er6: bool = False

@dataclass
class FilePayload:
    lang_index: int
    packed_length: int
    data_ptr: int
    original_length: Optional[int] = None
    mime_type: Optional[str] = None
    compression: Optional[str] = None

@dataclass
class FileRecord:
    index: int
    record_offset: int
    record_type: int
    record_type_name: str
    file_type: Optional[int] = None
    file_type_name: Optional[str] = None
    file_details: Optional[int] = None
    source_name: Optional[str] = None
    dest_name: Optional[str] = None
    payloads: list[FilePayload] = field(default_factory=list)
    extra: dict[str, Any] = field(default_factory=dict)

@dataclass
class Requisite:
    index: int
    uid: int
    major: int
    minor: int
    variant: int
    names: list[str]

@dataclass
class CertificateInfo:
    year: int
    month: int
    day: int
    hour: int
    minute: int
    second: int
    number_of_certificates: int

@dataclass
class ParsedSIS:
    path: str
    file_size: int
    header: Header
    languages: list[dict[str, Any]]
    component_names: list[str]
    file_records: list[FileRecord]
    requisites: list[Requisite]
    certificate_info: Optional[CertificateInfo]
    warnings: list[str] = field(default_factory=list)

# ---------- parser ----------

class OldSISParser:
    def __init__(self, data: bytes, path: str = "<memory>") -> None:
        self.data = data
        self.path = path
        self.warnings: list[str] = []

    def parse(self) -> ParsedSIS:
        hdr = self.parse_header()
        langs = self.parse_languages(hdr)
        names = self.parse_component_names(hdr, len(langs))
        files = self.parse_file_records(hdr, len(langs))
        reqs = self.parse_requisites(hdr, len(langs))
        cert = self.parse_certificates(hdr)
        return ParsedSIS(
            path=self.path,
            file_size=len(self.data),
            header=hdr,
            languages=langs,
            component_names=names,
            file_records=files,
            requisites=reqs,
            certificate_info=cert,
            warnings=self.warnings,
        )

    def parse_header(self) -> Header:
        if len(self.data) < 0x44:
            raise ValueError("file too small for classic SIS header")

        uid1 = u32(self.data, 0x00)
        uid2 = u32(self.data, 0x04)
        uid3 = u32(self.data, 0x08)
        uid4 = u32(self.data, 0x0C)
        checksum = u16(self.data, 0x10)
        num_languages = u16(self.data, 0x12)
        num_files = u16(self.data, 0x14)
        num_requisites = u16(self.data, 0x16)
        installation_language = u16(self.data, 0x18)
        installation_files = u16(self.data, 0x1A)
        installation_drive = u16(self.data, 0x1C)
        num_capabilities = u16(self.data, 0x1E)
        installer_version = u32(self.data, 0x20)
        options = u16(self.data, 0x24)
        type_ = u16(self.data, 0x26)
        major = u16(self.data, 0x28)
        minor = u16(self.data, 0x2A)
        variant = u32(self.data, 0x2C)
        languages_ptr = u32(self.data, 0x30)
        files_ptr = u32(self.data, 0x34)
        requisites_ptr = u32(self.data, 0x38)
        certificates_ptr = u32(self.data, 0x3C)
        component_name_ptr = u32(self.data, 0x40)

        # UID2 0x10003A12 is the ER6 marker in the reference docs
        is_er6 = (uid2 == 0x10003A12) and len(self.data) >= 0x64

        signature_ptr = None
        capabilities_ptr = None
        installed_space = None
        max_installed_space = None
        reserved = None

        if is_er6 and len(self.data) >= 0x64:
            signature_ptr = u32(self.data, 0x44)
            capabilities_ptr = u32(self.data, 0x48)
            installed_space = u32(self.data, 0x4C)
            max_installed_space = u32(self.data, 0x50)
            reserved = safe_slice(self.data, 0x54, 16)

        return Header(
            uid1=uid1,
            uid2=uid2,
            uid3=uid3,
            uid4=uid4,
            checksum=checksum,
            num_languages=num_languages,
            num_files=num_files,
            num_requisites=num_requisites,
            installation_language=installation_language,
            installation_files=installation_files,
            installation_drive=installation_drive,
            num_capabilities=num_capabilities,
            installer_version=installer_version,
            options=options,
            type=type_,
            major=major,
            minor=minor,
            variant=variant,
            languages_ptr=languages_ptr,
            files_ptr=files_ptr,
            requisites_ptr=requisites_ptr,
            certificates_ptr=certificates_ptr,
            component_name_ptr=component_name_ptr,
            signature_ptr=signature_ptr,
            capabilities_ptr=capabilities_ptr,
            installed_space=installed_space,
            max_installed_space=max_installed_space,
            reserved=reserved,
            is_er6=is_er6,
        )

    def parse_languages(self, hdr: Header) -> list[dict[str, Any]]:
        out = []
        ptr = hdr.languages_ptr
        for i in range(hdr.num_languages):
            code = u16(self.data, ptr + i * 2)
            out.append({
                "index": i,
                "code": code,
                "code_hex": f"0x{code:04X}",
                "name": LANG_CODES.get(code, "Unknown"),
            })
        return out

    def parse_component_names(self, hdr: Header, num_languages: int) -> list[str]:
        # Classic docs describe component name pointer to a record with
        # length(s) followed by pointer(s), one per language.
        ptr = hdr.component_name_ptr
        names = []

        if ptr == 0:
            return names

        try:
            lengths = [u32(self.data, ptr + i * 4) for i in range(num_languages)]
            ptrs_base = ptr + 4 * num_languages
            ptrs = [u32(self.data, ptrs_base + i * 4) for i in range(num_languages)]
            for ln, p in zip(lengths, ptrs):
                names.append(read_probable_string(self.data, p, ln))
        except Exception as e:
            self.warnings.append(f"failed to parse component names at 0x{ptr:X}: {e}")

        return names

    def parse_file_records(self, hdr: Header, num_languages: int) -> list[FileRecord]:
        out: list[FileRecord] = []
        ptr = hdr.files_ptr

        for idx in range(hdr.num_files):
            rec_off = ptr
            rtype = u32(self.data, ptr)

            if rtype in (0, 1):
                multiple_lang = (rtype == 1)
                n = num_languages if multiple_lang else 1

                ftype = u32(self.data, ptr + 0x04)
                fdetails = u32(self.data, ptr + 0x08)
                src_len = u32(self.data, ptr + 0x0C)
                src_ptr = u32(self.data, ptr + 0x10)
                dst_len = u32(self.data, ptr + 0x14)
                dst_ptr = u32(self.data, ptr + 0x18)

                src = read_probable_string(self.data, src_ptr, src_len) if src_len else ""
                dst = read_probable_string(self.data, dst_ptr, dst_len) if dst_len else ""

                payloads: list[FilePayload] = []

                lengths_off = ptr + 0x1C
                ptrs_off = lengths_off + 4 * n
                lengths = [u32(self.data, lengths_off + i * 4) for i in range(n)]
                data_ptrs = [u32(self.data, ptrs_off + i * 4) for i in range(n)]

                orig_lengths: list[Optional[int]] = [None] * n
                mime_type: Optional[str] = None

                next_ptr = ptrs_off + 4 * n

                if hdr.is_er6:
                    orig_off = next_ptr
                    orig_lengths = [u32(self.data, orig_off + i * 4) for i in range(n)]
                    mime_len = u32(self.data, orig_off + 4 * n)
                    mime_ptr = u32(self.data, orig_off + 4 * n + 4)
                    if mime_len:
                        try:
                            mime_type = read_probable_string(self.data, mime_ptr, mime_len)
                        except Exception:
                            mime_type = None
                    next_ptr = orig_off + 4 * n + 8

                for lang_index in range(n):
                    compression = None
                    if hdr.is_er6:
                        packed = lengths[lang_index]
                        orig = orig_lengths[lang_index]
                        if orig is not None and packed == orig:
                            compression = "stored"
                        elif orig is not None and packed < orig:
                            compression = "probably zlib-compressed"
                        else:
                            compression = "unknown"
                    payloads.append(FilePayload(
                        lang_index=lang_index,
                        packed_length=lengths[lang_index],
                        data_ptr=data_ptrs[lang_index],
                        original_length=orig_lengths[lang_index],
                        mime_type=mime_type,
                        compression=compression,
                    ))

                rec = FileRecord(
                    index=idx,
                    record_offset=rec_off,
                    record_type=rtype,
                    record_type_name=FILE_RECORD_TYPES.get(rtype, f"unknown({rtype})"),
                    file_type=ftype,
                    file_type_name=FILE_TYPES.get(ftype, f"unknown({ftype})"),
                    file_details=fdetails,
                    source_name=src,
                    dest_name=dst,
                    payloads=payloads,
                )
                out.append(rec)
                ptr = next_ptr
                continue

            if rtype == 2:
                num_options = u32(self.data, ptr + 0x04)
                rec = FileRecord(
                    index=idx,
                    record_offset=rec_off,
                    record_type=rtype,
                    record_type_name=FILE_RECORD_TYPES.get(rtype, f"unknown({rtype})"),
                    extra={"num_options": num_options},
                )

                # Layout:
                # 0x08 ... option strings block (lengths+ptrs per lang per option)
                # then 16-byte selected options bitmap
                # We don't fully walk it here because string grouping is awkward and
                # less useful than the file map itself.
                # Best-effort skip:
                ptr += 0x08 + (num_options * num_languages * 8) + 16
                out.append(rec)
                continue

            if rtype in (3, 4):
                expr_size = u32(self.data, ptr + 0x04)
                rec = FileRecord(
                    index=idx,
                    record_offset=rec_off,
                    record_type=rtype,
                    record_type_name=FILE_RECORD_TYPES.get(rtype, f"unknown({rtype})"),
                    extra={"conditional_expression_size": expr_size},
                )
                ptr += 0x08 + expr_size
                out.append(rec)
                continue

            if rtype in (5, 6):
                rec = FileRecord(
                    index=idx,
                    record_offset=rec_off,
                    record_type=rtype,
                    record_type_name=FILE_RECORD_TYPES.get(rtype, f"unknown({rtype})"),
                )
                ptr += 0x04
                out.append(rec)
                continue

            self.warnings.append(
                f"unknown file record type {rtype} at 0x{rec_off:X}; stopping file record parse"
            )
            break

        return out

    def parse_requisites(self, hdr: Header, num_languages: int) -> list[Requisite]:
        out: list[Requisite] = []
        ptr = hdr.requisites_ptr

        if ptr == 0 or hdr.num_requisites == 0:
            return out

        for idx in range(hdr.num_requisites):
            uid = u32(self.data, ptr + 0x00)
            major = u16(self.data, ptr + 0x04)
            minor = u16(self.data, ptr + 0x06)
            variant = u32(self.data, ptr + 0x08)

            lengths = [u32(self.data, ptr + 0x0C + i * 4) for i in range(num_languages)]
            ptrs_base = ptr + 0x0C + 4 * num_languages
            str_ptrs = [u32(self.data, ptrs_base + i * 4) for i in range(num_languages)]

            names = []
            for ln, sp in zip(lengths, str_ptrs):
                names.append(read_probable_string(self.data, sp, ln))

            out.append(Requisite(
                index=idx,
                uid=uid,
                major=major,
                minor=minor,
                variant=variant,
                names=names,
            ))

            ptr = ptrs_base + 4 * num_languages

        return out

    def parse_certificates(self, hdr: Header) -> Optional[CertificateInfo]:
        ptr = hdr.certificates_ptr
        if ptr == 0:
            return None

        try:
            return CertificateInfo(
                year=u16(self.data, ptr + 0x00),
                month=u16(self.data, ptr + 0x02),
                day=u16(self.data, ptr + 0x04),
                hour=u16(self.data, ptr + 0x06),
                minute=u16(self.data, ptr + 0x08),
                second=u16(self.data, ptr + 0x0A),
                number_of_certificates=u32(self.data, ptr + 0x0C),
            )
        except Exception as e:
            self.warnings.append(f"failed to parse certificates record at 0x{ptr:X}: {e}")
            return None

# ---------- extraction ----------

def sanitize_name(name: str) -> str:
    bad = '<>:"|?*'
    s = "".join("_" if c in bad else c for c in name)
    s = s.replace("\\", "/")
    while s.startswith("/"):
        s = s[1:]
    return s or "unnamed.bin"

def maybe_decompress_er6(blob: bytes, original_length: Optional[int]) -> tuple[bytes, str]:
    if original_length is None:
        return blob, "raw"

    if len(blob) == original_length:
        return blob, "stored"

    # Try zlib first, which is what classic ER6 docs describe when compression is used.
    try:
        dec = zlib.decompress(blob)
        if original_length == 0 or len(dec) == original_length:
            return dec, "zlib"
        return dec, "zlib-length-mismatch"
    except Exception:
        return blob, "raw-or-unknown"

def extract_payloads(parsed: ParsedSIS, data: bytes, outdir: Path) -> None:
    mkdirp(outdir)

    for rec in parsed.file_records:
        if rec.file_type is None:
            continue
        if not rec.payloads:
            continue

        base_name = rec.dest_name or rec.source_name or f"record_{rec.index}.bin"

        for i, payload in enumerate(rec.payloads):
            try:
                blob = safe_slice(data, payload.data_ptr, payload.packed_length)
            except Exception as e:
                print(f"[!] skip record {rec.index} payload {i}: {e}", file=sys.stderr)
                continue

            if parsed.header.is_er6:
                out_blob, method = maybe_decompress_er6(blob, payload.original_length)
            else:
                out_blob, method = (blob, "raw")

            suffix = f".lang{payload.lang_index}" if len(rec.payloads) > 1 else ""
            out_name = sanitize_name(base_name) + suffix
            out_path = outdir / out_name
            mkdirp(out_path.parent)
            out_path.write_bytes(out_blob)

            print(f"[+] extracted {out_path} ({len(out_blob)} bytes, method={method})")

# ---------- presentation ----------

def header_options_to_list(x: int) -> list[str]:
    out = []
    for bit, name in HEADER_OPTIONS_BITS.items():
        if x & bit:
            out.append(name)
    if not out and x == 0:
        out.append("none/0")
    return out

def print_report(parsed: ParsedSIS) -> None:
    h = parsed.header

    print(f"File: {parsed.path}")
    print(f"Size: {parsed.file_size} bytes")
    print()

    print("[Header]")
    print(f"UID1:                 {fmt_uid(h.uid1)}")
    print(f"UID2:                 {fmt_uid(h.uid2)}")
    print(f"UID3:                 {fmt_uid(h.uid3)}")
    print(f"UID4:                 {fmt_uid(h.uid4)}")
    print(f"Checksum:             0x{h.checksum:04X}")
    print(f"Format guess:         {'EPOC Release 6 classic SIS' if h.is_er6 else 'classic SIS (pre-ER6 or unknown)'}")
    print(f"Installer version:    0x{h.installer_version:08X}")
    print(f"Package version:      {h.major}.{h.minor}.{h.variant}")
    print(f"Options:              0x{h.options:04X} ({', '.join(header_options_to_list(h.options))})")
    print(f"Type:                 0x{h.type:04X}")
    print(f"Languages:            {h.num_languages}")
    print(f"Files:                {h.num_files}")
    print(f"Requisites:           {h.num_requisites}")
    print(f"Installation language:{h.installation_language}")
    print(f"Installation files:   {h.installation_files}")
    print(f"Installation drive:   0x{h.installation_drive:04X} ({chr(h.installation_drive) if 32 <= h.installation_drive <= 126 else '?'})")
    print(f"Capabilities count:   {h.num_capabilities}")
    print(f"Languages ptr:        0x{h.languages_ptr:X}")
    print(f"Files ptr:            0x{h.files_ptr:X}")
    print(f"Requisites ptr:       0x{h.requisites_ptr:X}")
    print(f"Certificates ptr:     0x{h.certificates_ptr:X}")
    print(f"Component name ptr:   0x{h.component_name_ptr:X}")
    if h.is_er6:
        print(f"Signature ptr:        0x{(h.signature_ptr or 0):X}")
        print(f"Capabilities ptr:     0x{(h.capabilities_ptr or 0):X}")
        print(f"Installed space:      {h.installed_space}")
        print(f"Max installed space:  {h.max_installed_space}")
    print()

    print("[Languages]")
    for lang in parsed.languages:
        print(f"{lang['index']:2d}: {lang['code_hex']}  {lang['name']}")
    print()

    print("[Component names]")
    if parsed.component_names:
        for i, name in enumerate(parsed.component_names):
            print(f"{i:2d}: {name}")
    else:
        print("(none parsed)")
    print()

    print("[Requisites]")
    if parsed.requisites:
        for r in parsed.requisites:
            print(
                f"{r.index:2d}: UID={fmt_uid(r.uid)} "
                f"minver={r.major}.{r.minor} variant={r.variant} "
                f"name(s)={r.names}"
            )
    else:
        print("(none)")
    print()

    print("[Certificates]")
    if parsed.certificate_info:
        c = parsed.certificate_info
        print(
            f"timestamp={c.year:04d}-{c.month:02d}-{c.day:02d} "
            f"{c.hour:02d}:{c.minute:02d}:{c.second:02d}"
        )
        print(f"number_of_certificates={c.number_of_certificates}")
    else:
        print("(none)")
    print()

    print("[File records]")
    for rec in parsed.file_records:
        print(f"- index={rec.index} off=0x{rec.record_offset:X} type={rec.record_type_name}")
        if rec.file_type is not None:
            print(f"  file_type:    {rec.file_type_name} ({rec.file_type})")
        if rec.file_details is not None:
            print(f"  file_details: 0x{rec.file_details:08X}")
        if rec.source_name is not None:
            print(f"  source:       {rec.source_name}")
        if rec.dest_name is not None:
            print(f"  dest:         {rec.dest_name}")
        for p in rec.payloads:
            extra = f", original={p.original_length}" if p.original_length is not None else ""
            comp = f", compression={p.compression}" if p.compression else ""
            mime = f", mime={p.mime_type}" if p.mime_type else ""
            print(
                f"  payload[{p.lang_index}]: ptr=0x{p.data_ptr:X}, packed={p.packed_length}"
                f"{extra}{comp}{mime}"
            )
        if rec.extra:
            print(f"  extra:        {rec.extra}")
    print()

    if parsed.warnings:
        print("[Warnings]")
        for w in parsed.warnings:
            print(f"- {w}")

# ---------- main ----------

def to_jsonable(parsed: ParsedSIS) -> dict[str, Any]:
    obj = asdict(parsed)
    # Bytes don't serialize directly
    if obj["header"].get("reserved") is not None:
        obj["header"]["reserved"] = obj["header"]["reserved"].hex()
    return obj

def main() -> int:
    ap = argparse.ArgumentParser(description="Inspect classic Symbian/EPOC SIS files")
    ap.add_argument("sis_file", type=Path, help="Path to classic .sis file")
    ap.add_argument("--json", action="store_true", help="Emit JSON instead of text")
    ap.add_argument("--extract", type=Path, help="Extract file payloads to this directory")
    args = ap.parse_args()

    if not args.sis_file.is_file():
        print(f"error: file not found: {args.sis_file}", file=sys.stderr)
        return 1

    data = args.sis_file.read_bytes()

    try:
        parser = OldSISParser(data, str(args.sis_file))
        parsed = parser.parse()
    except Exception as e:
        print(f"error: failed to parse {args.sis_file}: {e}", file=sys.stderr)
        return 2

    if args.json:
        print(json.dumps(to_jsonable(parsed), indent=2, ensure_ascii=False))
    else:
        print_report(parsed)

    if args.extract:
        extract_payloads(parsed, data, args.extract)

    return 0

if __name__ == "__main__":
    raise SystemExit(main())

