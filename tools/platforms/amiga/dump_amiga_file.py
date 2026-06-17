#!/usr/bin/env python3
"""
amiga_hunk_analyzer.py

Parse Amiga Hunk executables / object-like files and dump structure with hashes.

Usage:
    python amiga_hunk_analyzer.py file
    python amiga_hunk_analyzer.py file --json
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import struct
import sys
from dataclasses import dataclass, asdict
from typing import Any, BinaryIO, Dict, List, Optional, Tuple


# ---- Hunk constants ----
HUNK_UNIT      = 0x03E7
HUNK_NAME      = 0x03E8
HUNK_CODE      = 0x03E9
HUNK_DATA      = 0x03EA
HUNK_BSS       = 0x03EB
HUNK_RELOC32   = 0x03EC
HUNK_RELOC16   = 0x03ED
HUNK_RELOC8    = 0x03EE
HUNK_EXT       = 0x03EF
HUNK_SYMBOL    = 0x03F0
HUNK_DEBUG     = 0x03F1
HUNK_END       = 0x03F2
HUNK_HEADER    = 0x03F3
HUNK_OVERLAY   = 0x03F5
HUNK_BREAK     = 0x03F6
HUNK_DREL32    = 0x03F7
HUNK_DREL16    = 0x03F8
HUNK_DREL8     = 0x03F9
HUNK_LIB       = 0x03FA
HUNK_INDEX     = 0x03FB
HUNK_RELOC32SHORT = 0x03FC
HUNK_RELRELOC32 = 0x03FD
HUNK_ABSRELOC16 = 0x03FE

HUNK_NAMES = {
    HUNK_UNIT: "HUNK_UNIT",
    HUNK_NAME: "HUNK_NAME",
    HUNK_CODE: "HUNK_CODE",
    HUNK_DATA: "HUNK_DATA",
    HUNK_BSS: "HUNK_BSS",
    HUNK_RELOC32: "HUNK_RELOC32",
    HUNK_RELOC16: "HUNK_RELOC16",
    HUNK_RELOC8: "HUNK_RELOC8",
    HUNK_EXT: "HUNK_EXT",
    HUNK_SYMBOL: "HUNK_SYMBOL",
    HUNK_DEBUG: "HUNK_DEBUG",
    HUNK_END: "HUNK_END",
    HUNK_HEADER: "HUNK_HEADER",
    HUNK_OVERLAY: "HUNK_OVERLAY",
    HUNK_BREAK: "HUNK_BREAK",
    HUNK_DREL32: "HUNK_DREL32",
    HUNK_DREL16: "HUNK_DREL16",
    HUNK_DREL8: "HUNK_DREL8",
    HUNK_LIB: "HUNK_LIB",
    HUNK_INDEX: "HUNK_INDEX",
    HUNK_RELOC32SHORT: "HUNK_RELOC32SHORT",
    HUNK_RELRELOC32: "HUNK_RELRELOC32",
    HUNK_ABSRELOC16: "HUNK_ABSRELOC16",
}

# Upper two bits may carry memory flags / attributes in some contexts.
HUNK_TYPE_MASK = 0x3FFFFFFF


def u32be(data: bytes, off: int) -> int:
    return struct.unpack_from(">I", data, off)[0]


def sha256_hex(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def md5_hex(data: bytes) -> str:
    return hashlib.md5(data).hexdigest()


class ParseError(Exception):
    pass


@dataclass
class HunkRecord:
    index: int
    offset_start: int
    offset_end: int
    type_raw: int
    type_id: int
    type_name: str
    size_bytes: int
    sha256: str
    md5: str
    details: Dict[str, Any]


@dataclass
class ParsedFile:
    file_path: str
    file_size: int
    file_sha256: str
    hunk_header: Optional[Dict[str, Any]]
    hunks: List[HunkRecord]


class Reader:
    def __init__(self, blob: bytes) -> None:
        self.blob = blob
        self.pos = 0
        self.size = len(blob)

    def tell(self) -> int:
        return self.pos

    def eof(self) -> bool:
        return self.pos >= self.size

    def seek(self, pos: int) -> None:
        if not (0 <= pos <= self.size):
            raise ParseError(f"seek out of range: {pos:#x}")
        self.pos = pos

    def read(self, n: int) -> bytes:
        if self.pos + n > self.size:
            raise ParseError(f"unexpected EOF at {self.pos:#x}, wanted {n} bytes")
        out = self.blob[self.pos:self.pos + n]
        self.pos += n
        return out

    def read_u32(self) -> int:
        return struct.unpack(">I", self.read(4))[0]

    def read_longword_string(self) -> str:
        """
        Hunk strings are stored as:
            ULONG count_in_longwords
            count_in_longwords * 4 bytes of string storage
        NUL-padded.
        """
        count = self.read_u32()
        if count == 0:
            return ""
        raw = self.read(count * 4)
        return raw.split(b"\x00", 1)[0].decode("latin-1", errors="replace")

    def read_name_with_known_count(self, count: int) -> str:
        raw = self.read(count * 4)
        return raw.split(b"\x00", 1)[0].decode("latin-1", errors="replace")


def parse_hunk_header(r: Reader) -> Dict[str, Any]:
    start = r.tell()
    hunk_type_raw = r.read_u32()
    hunk_type = hunk_type_raw & HUNK_TYPE_MASK
    if hunk_type != HUNK_HEADER:
        raise ParseError(f"file does not start with HUNK_HEADER at 0x{start:x}")

    resident_names = []
    while True:
        n = r.read_u32()
        if n == 0:
            break
        resident_names.append(r.read_name_with_known_count(n))

    table_size = r.read_u32()
    first_hunk = r.read_u32()
    last_hunk = r.read_u32()

    if last_hunk < first_hunk:
        raise ParseError(f"invalid hunk range: first={first_hunk}, last={last_hunk}")

    size_count = last_hunk - first_hunk + 1
    hunk_sizes = []
    for _ in range(size_count):
        raw_size = r.read_u32()
        mem_type = raw_size & 0xC0000000
        size_longs = raw_size & 0x3FFFFFFF
        hunk_sizes.append({
            "raw": raw_size,
            "size_longs": size_longs,
            "size_bytes": size_longs * 4,
            "memory_flags": mem_type >> 30,
        })

    return {
        "offset_start": start,
        "offset_end": r.tell(),
        "resident_names": resident_names,
        "table_size": table_size,
        "first_hunk": first_hunk,
        "last_hunk": last_hunk,
        "size_table": hunk_sizes,
    }


def parse_reloc32_groups(r: Reader) -> List[Dict[str, Any]]:
    groups = []
    while True:
        count = r.read_u32()
        if count == 0:
            break
        target_hunk = r.read_u32()
        offsets = [r.read_u32() for _ in range(count)]
        groups.append({
            "target_hunk": target_hunk,
            "offset_count": count,
            "offsets": offsets,
        })
    return groups


def parse_symbol_table(r: Reader) -> List[Dict[str, Any]]:
    syms = []
    while True:
        name_longs = r.read_u32()
        if name_longs == 0:
            break
        name = r.read_name_with_known_count(name_longs)
        value = r.read_u32()
        syms.append({
            "name": name,
            "value": value,
        })
    return syms


def parse_name_hunk(r: Reader) -> str:
    name_longs = r.read_u32()
    if name_longs == 0:
        return ""
    return r.read_name_with_known_count(name_longs)


def parse_code_or_data(r: Reader) -> Tuple[int, bytes]:
    size_longs = r.read_u32()
    payload = r.read(size_longs * 4)
    return size_longs, payload


def parse_bss(r: Reader) -> int:
    return r.read_u32()


def parse_debug(r: Reader) -> Tuple[int, bytes]:
    size_longs = r.read_u32()
    payload = r.read(size_longs * 4)
    return size_longs, payload


def parse_one_hunk(r: Reader, hunk_index: int) -> HunkRecord:
    start = r.tell()
    type_raw = r.read_u32()
    type_id = type_raw & HUNK_TYPE_MASK
    type_name = HUNK_NAMES.get(type_id, f"UNKNOWN_{type_id:#x}")
    details: Dict[str, Any] = {}

    if type_id in (HUNK_CODE, HUNK_DATA):
        size_longs, payload = parse_code_or_data(r)
        details["size_longs"] = size_longs
        details["declared_size_bytes"] = size_longs * 4
        if type_id == HUNK_CODE:
            details["payload_preview_hex"] = payload[:32].hex()
        elif type_id == HUNK_DATA:
            details["payload_preview_hex"] = payload[:32].hex()

    elif type_id == HUNK_BSS:
        size_longs = parse_bss(r)
        details["size_longs"] = size_longs
        details["declared_size_bytes"] = size_longs * 4

    elif type_id in (HUNK_RELOC32, HUNK_RELOC16, HUNK_RELOC8,
                     HUNK_DREL32, HUNK_DREL16, HUNK_DREL8,
                     HUNK_RELOC32SHORT, HUNK_RELRELOC32, HUNK_ABSRELOC16):
        groups = parse_reloc32_groups(r)
        details["group_count"] = len(groups)
        details["groups"] = groups

    elif type_id == HUNK_SYMBOL:
        syms = parse_symbol_table(r)
        details["symbol_count"] = len(syms)
        details["symbols"] = syms

    elif type_id == HUNK_DEBUG:
        size_longs, payload = parse_debug(r)
        details["size_longs"] = size_longs
        details["declared_size_bytes"] = size_longs * 4
        details["payload_preview_hex"] = payload[:32].hex()

    elif type_id in (HUNK_NAME, HUNK_UNIT):
        name = parse_name_hunk(r)
        details["name"] = name

    elif type_id in (HUNK_END, HUNK_BREAK):
        pass

    else:
        raise ParseError(
            f"unsupported or unknown hunk type {type_name} ({type_id:#x}) at 0x{start:x}"
        )

    end = r.tell()
    raw_hunk = r.blob[start:end]

    return HunkRecord(
        index=hunk_index,
        offset_start=start,
        offset_end=end,
        type_raw=type_raw,
        type_id=type_id,
        type_name=type_name,
        size_bytes=end - start,
        sha256=sha256_hex(raw_hunk),
        md5=md5_hex(raw_hunk),
        details=details,
    )


def parse_hunk_file(path: str) -> ParsedFile:
    with open(path, "rb") as f:
        blob = f.read()

    r = Reader(blob)
    file_sha = sha256_hex(blob)

    header = parse_hunk_header(r)

    hunks: List[HunkRecord] = []
    idx = 0
    while not r.eof():
        hunks.append(parse_one_hunk(r, idx))
        idx += 1

    return ParsedFile(
        file_path=path,
        file_size=len(blob),
        file_sha256=file_sha,
        hunk_header=header,
        hunks=hunks,
    )


def dump_text(parsed: ParsedFile) -> None:
    print(f"File:            {parsed.file_path}")
    print(f"Size:            {parsed.file_size} bytes")
    print(f"SHA256:          {parsed.file_sha256}")
    print()

    hdr = parsed.hunk_header
    if hdr:
        print("== HUNK_HEADER ==")
        print(f"  Offset:        0x{hdr['offset_start']:08x}-0x{hdr['offset_end']:08x}")
        print(f"  First hunk:    {hdr['first_hunk']}")
        print(f"  Last hunk:     {hdr['last_hunk']}")
        print(f"  Table size:    {hdr['table_size']}")
        if hdr["resident_names"]:
            print(f"  Resident names:")
            for n in hdr["resident_names"]:
                print(f"    - {n}")
        print("  Size table:")
        for i, entry in enumerate(hdr["size_table"]):
            print(
                f"    [{i}] size_longs={entry['size_longs']} "
                f"size_bytes={entry['size_bytes']} mem_flags={entry['memory_flags']}"
            )
        print()

    print("== HUNKS ==")
    for h in parsed.hunks:
        print(
            f"[{h.index}] {h.type_name} "
            f"off=0x{h.offset_start:08x}-0x{h.offset_end:08x} "
            f"size={h.size_bytes} "
            f"sha256={h.sha256}"
        )
        d = h.details

        if h.type_id in (HUNK_CODE, HUNK_DATA, HUNK_BSS, HUNK_DEBUG):
            if "size_longs" in d:
                print(f"     declared_size_longs: {d['size_longs']}")
            if "declared_size_bytes" in d:
                print(f"     declared_size_bytes: {d['declared_size_bytes']}")
            if "payload_preview_hex" in d:
                print(f"     payload_preview_hex: {d['payload_preview_hex']}")

        elif h.type_id in (HUNK_RELOC32, HUNK_RELOC16, HUNK_RELOC8,
                           HUNK_DREL32, HUNK_DREL16, HUNK_DREL8,
                           HUNK_RELOC32SHORT, HUNK_RELRELOC32, HUNK_ABSRELOC16):
            print(f"     relocation_groups: {d['group_count']}")
            for gi, g in enumerate(d["groups"][:8]):
                print(
                    f"       group[{gi}] target_hunk={g['target_hunk']} "
                    f"offset_count={g['offset_count']}"
                )
                if g["offsets"]:
                    preview = ", ".join(f"0x{x:x}" for x in g["offsets"][:12])
                    if len(g["offsets"]) > 12:
                        preview += ", ..."
                    print(f"         offsets: {preview}")

        elif h.type_id == HUNK_SYMBOL:
            print(f"     symbols: {d['symbol_count']}")
            for s in d["symbols"][:12]:
                print(f"       {s['name']} = 0x{s['value']:x}")
            if d["symbol_count"] > 12:
                print("       ...")

        elif h.type_id in (HUNK_NAME, HUNK_UNIT):
            print(f"     name: {d['name']}")

    print()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("file", help="Amiga Hunk-format file")
    ap.add_argument("--json", action="store_true", help="Emit JSON")
    args = ap.parse_args()

    try:
        parsed = parse_hunk_file(args.file)
    except Exception as e:
        print(f"ERROR: {e}", file=sys.stderr)
        return 1

    if args.json:
        serializable = asdict(parsed)
        print(json.dumps(serializable, indent=2))
    else:
        dump_text(parsed)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

