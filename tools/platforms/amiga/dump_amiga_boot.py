#!/usr/bin/env python3
"""
amiga_bootblock_analyzer.py

Analyze Amiga boot blocks (typically first 1024 bytes).

Usage:
    python amiga_bootblock_analyzer.py disk.adf
    python amiga_bootblock_analyzer.py bootblock.bin --bootblock-only
    python amiga_bootblock_analyzer.py some_dir --dir
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import struct
import sys
from typing import Any, Dict, Iterable, List, Optional


BOOTBLOCK_SIZE = 1024


def sha256_hex(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def md5_hex(data: bytes) -> str:
    return hashlib.md5(data).hexdigest()


def read_bootblock(path: str, bootblock_only: bool) -> bytes:
    with open(path, "rb") as f:
        blob = f.read()

    if bootblock_only:
        if len(blob) < BOOTBLOCK_SIZE:
            raise ValueError(f"{path}: shorter than 1024 bytes")
        return blob[:BOOTBLOCK_SIZE]

    # Disk image / file case: use first 1024 bytes.
    if len(blob) < BOOTBLOCK_SIZE:
        raise ValueError(f"{path}: file shorter than 1024 bytes")
    return blob[:BOOTBLOCK_SIZE]


def amiga_checksum_words(words: List[int]) -> int:
    """
    End-around carry sum over 256 big-endian 32-bit words.
    A valid AmigaDOS boot block sums to 0xFFFFFFFF.
    """
    total = 0
    for w in words:
        total += w
        total = (total & 0xFFFFFFFF) + (total >> 32)
    total = (total & 0xFFFFFFFF) + (total >> 32)
    return total & 0xFFFFFFFF


def parse_words_be(bb: bytes) -> List[int]:
    return list(struct.unpack(">" + "I" * (len(bb) // 4), bb))


def is_valid_amiga_boot_checksum(bb: bytes) -> bool:
    if len(bb) != BOOTBLOCK_SIZE:
        return False
    words = parse_words_be(bb)
    return amiga_checksum_words(words) == 0xFFFFFFFF


def compute_expected_checksum(bb: bytes) -> int:
    """
    Returns the checksum value that should be stored at offset 0x04
    so the full block sums to 0xFFFFFFFF.

    We zero the checksum field first, compute the sum, then choose:
        checksum = 0xFFFFFFFF - sum_with_zeroed_field
    with end-around carry semantics.
    """
    if len(bb) != BOOTBLOCK_SIZE:
        raise ValueError("boot block must be exactly 1024 bytes")

    temp = bytearray(bb)
    temp[4:8] = b"\x00\x00\x00\x00"
    words = parse_words_be(temp)
    s = amiga_checksum_words(words)
    needed = (0xFFFFFFFF - s) & 0xFFFFFFFF
    return needed


def analyze_bootblock(bb: bytes, path: str) -> Dict[str, Any]:
    sig = bb[0:3]
    flags = bb[3]
    checksum_stored = struct.unpack(">I", bb[4:8])[0]
    root_block = struct.unpack(">I", bb[8:12])[0]

    is_dos = sig == b"DOS"
    checksum_valid = is_valid_amiga_boot_checksum(bb)
    checksum_expected = compute_expected_checksum(bb)

    # Raw hashes
    raw_sha256 = sha256_hex(bb)
    raw_md5 = md5_hex(bb)

    # Code-area hash heuristic:
    # For DOS boot blocks, code/data usually starts at 0x0C.
    # For non-DOS/custom blocks, this may be wrong, so we also give full-block normalized hashes.
    code_area = bb[0x0C:]
    code_area_sha256 = sha256_hex(code_area)
    code_area_md5 = md5_hex(code_area)

    # Normalization 1: zero checksum and root block, keep DOS flags byte.
    norm1 = bytearray(bb)
    norm1[4:12] = b"\x00" * 8
    norm1_sha256 = sha256_hex(norm1)

    # Normalization 2: zero DOS flags too (0x03), plus checksum/root pointer.
    # This can help cluster semantically identical blocks across DOSx variants.
    norm2 = bytearray(bb)
    norm2[3:12] = b"\x00" * 9
    norm2_sha256 = sha256_hex(norm2)

    # Code-only normalized hash:
    # Just the bytes after 0x0B. Good when you want to avoid obvious variable fields.
    code_only_norm_sha256 = sha256_hex(bb[0x0C:])

    return {
        "path": path,
        "size": len(bb),
        "signature_ascii": sig.decode("latin-1", errors="replace"),
        "flags_byte": flags,
        "flags_hex": f"0x{flags:02x}",
        "looks_like_dos_bootblock": is_dos,
        "stored_checksum": checksum_stored,
        "stored_checksum_hex": f"0x{checksum_stored:08x}",
        "expected_checksum_hex": f"0x{checksum_expected:08x}",
        "checksum_valid": checksum_valid,
        "root_block": root_block,
        "root_block_hex": f"0x{root_block:08x}",
        "raw_sha256": raw_sha256,
        "raw_md5": raw_md5,
        "code_area_sha256": code_area_sha256,
        "code_area_md5": code_area_md5,
        "normalized_zero_cksum_root_sha256": norm1_sha256,
        "normalized_zero_flags_cksum_root_sha256": norm2_sha256,
        "code_only_normalized_sha256": code_only_norm_sha256,
        "header_hex": bb[:16].hex(),
        "code_preview_hex": bb[0x0C:0x0C + 32].hex(),
    }


def iter_files(root: str) -> Iterable[str]:
    for dirpath, _, filenames in os.walk(root):
        for name in filenames:
            yield os.path.join(dirpath, name)


def print_report(r: Dict[str, Any]) -> None:
    print(f"File:                             {r['path']}")
    print(f"Boot block size:                  {r['size']} bytes")
    print(f"Signature:                        {r['signature_ascii']!r}")
    print(f"Flags byte:                       {r['flags_hex']}")
    print(f"Looks like DOS boot block:        {r['looks_like_dos_bootblock']}")
    print(f"Stored checksum:                  {r['stored_checksum_hex']}")
    print(f"Expected checksum:                {r['expected_checksum_hex']}")
    print(f"Checksum valid:                   {r['checksum_valid']}")
    print(f"Root block pointer:               {r['root_block_hex']}")
    print(f"Raw SHA256:                       {r['raw_sha256']}")
    print(f"Code-area SHA256 [0x0c:0x400]:    {r['code_area_sha256']}")
    print(f"Norm SHA256 zero cksum+root:      {r['normalized_zero_cksum_root_sha256']}")
    print(f"Norm SHA256 zero flags+ck+root:   {r['normalized_zero_flags_cksum_root_sha256']}")
    print(f"Code-only normalized SHA256:      {r['code_only_normalized_sha256']}")
    print(f"Header hex:                       {r['header_hex']}")
    print(f"Code preview hex:                 {r['code_preview_hex']}")
    print()


def analyze_path(path: str, bootblock_only: bool) -> Dict[str, Any]:
    bb = read_bootblock(path, bootblock_only=bootblock_only)
    return analyze_bootblock(bb, path)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("path", help="disk image, raw bootblock, or directory")
    ap.add_argument("--bootblock-only", action="store_true",
                    help="Treat input files as raw 1024-byte bootblock dumps")
    ap.add_argument("--dir", action="store_true",
                    help="Recursively analyze all files under path")
    ap.add_argument("--json", action="store_true", help="Emit JSON")
    args = ap.parse_args()

    results: List[Dict[str, Any]] = []

    try:
        if args.dir:
            for p in iter_files(args.path):
                try:
                    results.append(analyze_path(p, bootblock_only=args.bootblock_only))
                except Exception as e:
                    results.append({"path": p, "error": str(e)})
        else:
            results.append(analyze_path(args.path, bootblock_only=args.bootblock_only))
    except Exception as e:
        print(f"ERROR: {e}", file=sys.stderr)
        return 1

    if args.json:
        print(json.dumps(results if args.dir else results[0], indent=2))
    else:
        for r in results:
            if "error" in r:
                print(f"File: {r['path']}")
                print(f"ERROR: {r['error']}")
                print()
            else:
                print_report(r)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
