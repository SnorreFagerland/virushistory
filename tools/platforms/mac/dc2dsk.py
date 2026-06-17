#!/usr/bin/env python3

#Convert DiskCopy42 images to MacIntosh DSK format"

import argparse
import os
import struct
import sys


DC42_HEADER_SIZE = 0x54
MACBINARY_HEADER_SIZE = 128

KNOWN_RAW_SIZES = {
    409600: "400K",
    737280: "720K",
    819200: "800K",
    1474560: "1.44M",
}


def dc42_checksum(data):
    c = 0
    if len(data) % 2:
        data += b"\x00"

    for idx in range(0, len(data), 2):
        c += (data[idx] << 8) | data[idx + 1]
        c &= 0xFFFFFFFF
        c = ((c >> 1) | (c << 31)) & 0xFFFFFFFF

    return c


def parse_dc42_header(buf, offset=0):
    if len(buf) < offset + DC42_HEADER_SIZE:
        raise ValueError("file too small for DC42 header")

    header = buf[offset:offset + DC42_HEADER_SIZE]

    name_len = header[0]
    if name_len > 63:
        raise ValueError("invalid DC42 name length")

    name = header[1:1 + name_len].decode("mac_roman", errors="replace")

    (
        data_size,
        tag_size,
        data_checksum,
        tag_checksum,
        encoding,
        format_byte,
        magic,
    ) = struct.unpack_from(">LLLLBBH", header, 0x40)

    if magic != 0x0100:
        raise ValueError(f"bad DC42 magic: 0x{magic:04x}")

    if data_size <= 0:
        raise ValueError("invalid data size")

    return {
        "name": name,
        "data_size": data_size,
        "tag_size": tag_size,
        "data_checksum": data_checksum,
        "tag_checksum": tag_checksum,
        "encoding": encoding,
        "format_byte": format_byte,
        "magic": magic,
        "data_offset": offset + DC42_HEADER_SIZE,
    }


def looks_like_macbinary(buf):
    if len(buf) < MACBINARY_HEADER_SIZE + DC42_HEADER_SIZE:
        return False

    name_len = buf[1]
    file_type = buf[65:69]
    creator = buf[69:73]

    return name_len <= 63 and file_type == b"dImg" and creator == b"dCpy"


def extract_dc42(buf):
    candidates = [0]

    if looks_like_macbinary(buf):
        candidates.insert(0, MACBINARY_HEADER_SIZE)

    last_error = None

    for offset in candidates:
        try:
            hdr = parse_dc42_header(buf, offset)
            data_start = hdr["data_offset"]
            data_end = data_start + hdr["data_size"]
            tag_end = data_end + hdr["tag_size"]

            if len(buf) < tag_end:
                raise ValueError("file ends before declared DC42 data/tag area")

            data = buf[data_start:data_end]
            tags = buf[data_end:tag_end]

            return hdr, data, tags, offset

        except ValueError as e:
            last_error = e

    raise ValueError(f"not a valid DC42 image: {last_error}")


def default_output_name(input_filename, disk_name):
    if disk_name:
        safe = "".join(c if c not in r'<>:"/\|?*' else "_" for c in disk_name)
        return safe + ".dsk"

    base, _ = os.path.splitext(input_filename)
    return base + ".dsk"


def main(argv):
    parser = argparse.ArgumentParser(
        description="Convert Disk Copy 4.2 images to raw .dsk images."
    )
    parser.add_argument("filename", help="input .dc42/.img/.bin file")
    parser.add_argument("-o", "--output", help="output raw .dsk filename")
    parser.add_argument(
        "--no-checksum",
        action="store_true",
        help="do not verify DC42 data checksum",
    )
    parser.add_argument(
        "--write-tags",
        metavar="FILE",
        help="write DC42 tag data to separate file if present",
    )

    args = parser.parse_args(argv[1:])

    with open(args.filename, "rb") as f:
        buf = f.read()

    hdr, data, tags, dc42_offset = extract_dc42(buf)

    if not args.no_checksum:
        actual = dc42_checksum(data)
        expected = hdr["data_checksum"]

        if actual != expected:
            raise ValueError(
                f"data checksum mismatch: expected 0x{expected:08x}, got 0x{actual:08x}"
            )

    output = args.output or default_output_name(args.filename, hdr["name"])

    with open(output, "wb") as f:
        f.write(data)

    if args.write_tags:
        with open(args.write_tags, "wb") as f:
            f.write(tags)

    size_label = KNOWN_RAW_SIZES.get(len(data), f"{len(data)} bytes")

    print(f"Input:      {args.filename}")
    print(f"DC42 name:  {hdr['name']!r}")
    print(f"Data size:  {len(data)} ({size_label})")
    print(f"Tag size:   {len(tags)}")
    print(f"Encoding:   0x{hdr['encoding']:02x}")
    print(f"Format:     0x{hdr['format_byte']:02x}")
    print(f"MacBinary:  {'yes' if dc42_offset == 128 else 'no'}")
    print(f"Output:     {output}")


if __name__ == "__main__":
    sys.exit(main(sys.argv))

