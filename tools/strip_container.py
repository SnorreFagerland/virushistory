#!/usr/bin/env python3
"""
strip_apple_rsrc.py

Extracts the resource fork payload from an AppleSingle or AppleDouble file.

Usage:
  python strip_apple_rsrc.py input_file output.rsrc
"""

import argparse
import struct
import sys


APPLESINGLE_MAGIC = 0x00051600
APPLEDOUBLE_MAGIC = 0x00051607

ENTRY_RESOURCE_FORK = 2


def u16(b, o):
    return struct.unpack_from(">H", b, o)[0]


def u32(b, o):
    return struct.unpack_from(">I", b, o)[0]


def extract_resource_fork(data):
    if len(data) < 26:
        raise ValueError("File too small for AppleSingle/AppleDouble header")

    magic = u32(data, 0)

    if magic == APPLESINGLE_MAGIC:
        container_type = "AppleSingle"
    elif magic == APPLEDOUBLE_MAGIC:
        container_type = "AppleDouble"
    else:
        raise ValueError(f"Not AppleSingle/AppleDouble: magic is 0x{magic:08X}")

    version = u32(data, 4)
    entry_count = u16(data, 24)

    table_off = 26
    table_len = entry_count * 12

    if table_off + table_len > len(data):
        raise ValueError(f"{container_type} entry table extends past end of file")

    for i in range(entry_count):
        off = table_off + i * 12

        entry_id = u32(data, off)
        entry_offset = u32(data, off + 4)
        entry_length = u32(data, off + 8)

        if entry_offset + entry_length > len(data):
            raise ValueError(
                f"Entry {i} id={entry_id} extends past end of file: "
                f"offset=0x{entry_offset:X}, length=0x{entry_length:X}"
            )

        if entry_id == ENTRY_RESOURCE_FORK:
            return data[entry_offset:entry_offset + entry_length], {
                "container_type": container_type,
                "magic": magic,
                "version": version,
                "entry_index": i,
                "entry_offset": entry_offset,
                "entry_length": entry_length,
            }

    raise ValueError(f"No resource fork entry found in {container_type} file")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("input", help="AppleSingle/AppleDouble input file")
    ap.add_argument("output", help="output raw resource fork file")
    args = ap.parse_args()

    with open(args.input, "rb") as f:
        data = f.read()

    try:
        rsrc, meta = extract_resource_fork(data)
    except Exception as e:
        print(f"ERROR: {e}", file=sys.stderr)
        return 1

    with open(args.output, "wb") as f:
        f.write(rsrc)

    print(f"Extracted {meta['container_type']} resource fork")
    print(f"Magic        : 0x{meta['magic']:08X}")
    print(f"Version      : 0x{meta['version']:08X}")
    print(f"Entry index  : {meta['entry_index']}")
    print(f"Entry offset : 0x{meta['entry_offset']:08X}")
    print(f"Entry length : {meta['entry_length']} bytes")
    print(f"Output       : {args.output}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

