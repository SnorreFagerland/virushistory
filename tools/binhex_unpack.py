#!/usr/bin/env python3
"""
binhex_unpack.py

Unpack a classic Macintosh BinHex 4.0 (.hqx) file.

Usage:
    python binhex_unpack.py sample.hqx
    python binhex_unpack.py sample.hqx -o outdir

Outputs:
    - <name>.data      (data fork)
    - <name>.rsrc      (resource fork, if present)
    - <name>.meta.json (metadata)

Notes:
    - This decodes BinHex 4.0 payloads in modern Python.
    - It does not try to reconstruct old Mac dual-fork filesystems; it writes
      forks as separate files.
"""

from __future__ import annotations

import argparse
import binascii
import json
import pathlib
import sys
from dataclasses import dataclass


# BinHex 4.0 alphabet.
# Commonly documented as:
# !"#$%&'()*+,-012345689@ABCDEFGHIJKLMNPQRSTUVXYZ[`abcdefhijklmpqr
HQX_ALPHABET = '!"#$%&\'()*+,-012345689@ABCDEFGHIJKLMNPQRSTUVXYZ[`abcdefhijklmpqr'
HQX_TABLE = {ch: i for i, ch in enumerate(HQX_ALPHABET)}


class BinHexError(Exception):
    pass


@dataclass
class BinHexHeader:
    name: str
    type_code: str
    creator_code: str
    flags: int
    data_len: int
    rsrc_len: int


def crc16_hqx(data: bytes, seed: int = 0) -> int:
    """Use Python's remaining crc_hqx helper."""
    return binascii.crc_hqx(data, seed) & 0xFFFF


def extract_hqx_text(raw_text: str) -> str:
    """
    Extract the actual HQX data between the first ':' and the last ':'.
    BinHex files typically contain a header line like:
        (This file must be converted with BinHex 4.0)
    followed by colon-delimited encoded data.
    """
    start = raw_text.find(":")
    end = raw_text.rfind(":")
    if start == -1 or end == -1 or end <= start:
        raise BinHexError("Could not locate BinHex payload delimited by ':' markers")

    payload = raw_text[start + 1:end]

    # Keep only valid HQX alphabet chars; ignore whitespace/newlines.
    cleaned = []
    for ch in payload:
        if ch in HQX_TABLE:
            cleaned.append(ch)
        elif ch in "\r\n\t ":
            continue
        else:
            # Ignore benign formatting noise, but reject obvious junk.
            # You can relax this if needed.
            continue
    if not cleaned:
        raise BinHexError("No valid BinHex payload found between ':' markers")
    return "".join(cleaned)


def hqx_decode(payload: str) -> bytes:
    """
    Decode BinHex 6-bit ASCII into raw bytes, before RLE expansion.
    BinHex uses a custom 64-character alphabet.
    """
    out = bytearray()
    bitbuf = 0
    bitcount = 0

    for ch in payload:
        val = HQX_TABLE[ch]
        bitbuf = (bitbuf << 6) | val
        bitcount += 6

        while bitcount >= 8:
            bitcount -= 8
            out.append((bitbuf >> bitcount) & 0xFF)

    # BinHex allows leftover padding bits at the end; ignore them.
    return bytes(out)


def rle_decode_hqx(data: bytes) -> bytes:
    """
    Decode BinHex RLE.

    Marker byte is 0x90.
    Rules:
      - <byte> 0x90 0x00    => literal 0x90
      - <byte> 0x90 <n>     => repeat previous output byte (n - 1) more times
    """
    out = bytearray()
    i = 0
    n = len(data)

    while i < n:
        b = data[i]
        i += 1

        if b != 0x90:
            out.append(b)
            continue

        if i >= n:
            raise BinHexError("Truncated RLE sequence at end of stream")

        count = data[i]
        i += 1

        if count == 0:
            out.append(0x90)
            continue

        if not out:
            raise BinHexError("RLE repeat marker encountered before any byte was output")

        out.extend([out[-1]] * (count - 1))

    return bytes(out)


class ByteReader:
    def __init__(self, data: bytes):
        self.data = data
        self.pos = 0

    def take(self, n: int) -> bytes:
        if self.pos + n > len(self.data):
            raise BinHexError(f"Unexpected end of data at offset {self.pos}, need {n} bytes")
        chunk = self.data[self.pos:self.pos + n]
        self.pos += n
        return chunk

    def take_u8(self) -> int:
        return self.take(1)[0]

    def take_u16be(self) -> int:
        return int.from_bytes(self.take(2), "big")

    def take_u32be(self) -> int:
        return int.from_bytes(self.take(4), "big")


def parse_header(reader: ByteReader) -> BinHexHeader:
    """
    Parse BinHex file header.

    Layout:
      1   filename length
      N   filename bytes
      1   version byte / null terminator (usually 0)
      4   file type
      4   creator
      2   flags
      4   data fork length
      4   resource fork length
      2   header CRC
    """
    start = reader.pos

    name_len = reader.take_u8()
    if name_len == 0:
        raise BinHexError("Invalid BinHex header: empty filename")
    if name_len > 63:
        raise BinHexError(f"Implausible BinHex filename length: {name_len}")

    name_bytes = reader.take(name_len)
    _null = reader.take_u8()
    type_bytes = reader.take(4)
    creator_bytes = reader.take(4)
    flags = reader.take_u16be()
    data_len = reader.take_u32be()
    rsrc_len = reader.take_u32be()

    header_without_crc = reader.data[start:reader.pos]
    stored_crc = reader.take_u16be()
    calc_crc = crc16_hqx(header_without_crc)

    if stored_crc != calc_crc:
        raise BinHexError(
            f"Header CRC mismatch: stored=0x{stored_crc:04X}, calculated=0x{calc_crc:04X}"
        )

    try:
        name = name_bytes.decode("mac_roman")
    except Exception:
        name = name_bytes.decode("latin-1", errors="replace")

    type_code = type_bytes.decode("latin-1", errors="replace")
    creator_code = creator_bytes.decode("latin-1", errors="replace")

    return BinHexHeader(
        name=name,
        type_code=type_code,
        creator_code=creator_code,
        flags=flags,
        data_len=data_len,
        rsrc_len=rsrc_len,
    )


def read_fork_with_crc(reader: ByteReader, size: int, label: str) -> bytes:
    payload = reader.take(size)
    stored_crc = reader.take_u16be()
    calc_crc = crc16_hqx(payload)
    if stored_crc != calc_crc:
        raise BinHexError(
            f"{label} CRC mismatch: stored=0x{stored_crc:04X}, calculated=0x{calc_crc:04X}"
        )
    return payload


def sanitize_filename(name: str) -> str:
    bad = '<>:"/\\|?*\x00'
    out = "".join("_" if ch in bad or ord(ch) < 32 else ch for ch in name).strip()
    return out or "unnamed"


def unpack_hqx_file(input_path: pathlib.Path, output_dir: pathlib.Path) -> None:
    text = input_path.read_text(encoding="latin-1", errors="replace")

    hqx_text = extract_hqx_text(text)
    raw = hqx_decode(hqx_text)
    expanded = rle_decode_hqx(raw)

    reader = ByteReader(expanded)
    header = parse_header(reader)
    data_fork = read_fork_with_crc(reader, header.data_len, "Data fork")
    rsrc_fork = read_fork_with_crc(reader, header.rsrc_len, "Resource fork")

    safe_name = sanitize_filename(header.name)
    output_dir.mkdir(parents=True, exist_ok=True)

    data_path = output_dir / f"{safe_name}.data"
    meta_path = output_dir / f"{safe_name}.meta.json"
    rsrc_path = output_dir / f"{safe_name}.rsrc"

    data_path.write_bytes(data_fork)
    if rsrc_fork:
        rsrc_path.write_bytes(rsrc_fork)

    metadata = {
        "original_hqx": str(input_path),
        "name": header.name,
        "type_code": header.type_code,
        "creator_code": header.creator_code,
        "flags": header.flags,
        "flags_hex": f"0x{header.flags:04X}",
        "data_len": header.data_len,
        "resource_len": header.rsrc_len,
        "outputs": {
            "data_fork": str(data_path),
            "resource_fork": str(rsrc_path) if rsrc_fork else None,
        },
    }

    meta_path.write_text(json.dumps(metadata, indent=2), encoding="utf-8")

    print(f"[+] Name         : {header.name}")
    print(f"[+] Type         : {header.type_code!r}")
    print(f"[+] Creator      : {header.creator_code!r}")
    print(f"[+] Flags        : 0x{header.flags:04X}")
    print(f"[+] Data fork    : {header.data_len} bytes -> {data_path}")
    if rsrc_fork:
        print(f"[+] Resource fork: {header.rsrc_len} bytes -> {rsrc_path}")
    else:
        print(f"[+] Resource fork: 0 bytes")
    print(f"[+] Metadata     : {meta_path}")

    trailing = len(reader.data) - reader.pos
    if trailing:
        print(f"[!] Warning: {trailing} trailing bytes remain after parse")


def main() -> int:
    parser = argparse.ArgumentParser(description="Unpack a BinHex (.hqx) file")
    parser.add_argument("input", type=pathlib.Path, help="Input .hqx file")
    parser.add_argument(
        "-o", "--output",
        type=pathlib.Path,
        default=pathlib.Path("out_hqx"),
        help="Output directory (default: out_hqx)"
    )
    args = parser.parse_args()

    try:
        unpack_hqx_file(args.input, args.output)
        return 0
    except BinHexError as e:
        print(f"[-] BinHex decode error: {e}", file=sys.stderr)
        return 2
    except FileNotFoundError:
        print(f"[-] File not found: {args.input}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"[-] Unexpected error: {e}", file=sys.stderr)
        return 3


if __name__ == "__main__":
    raise SystemExit(main())

