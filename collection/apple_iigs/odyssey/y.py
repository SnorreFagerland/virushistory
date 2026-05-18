#!/usr/bin/env python3

import sys
from pathlib import Path

def main():
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} <input_file> <output_file> <16bit_hex_key>")
        print(f"Example: {sys.argv[0]} sample.bin out.bin feff")
        sys.exit(1)

    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])
    key_hex = sys.argv[3]

    if len(key_hex) != 4:
        print("Key must be exactly 4 hex characters (16-bit)")
        sys.exit(1)

    try:
        key = bytes.fromhex(key_hex)
    except ValueError:
        print("Invalid hex key")
        sys.exit(1)

    data = input_path.read_bytes()

    out = bytearray(len(data))

    for i in range(len(data)):
        out[i] = data[i] ^ key[i % 2]

    output_path.write_bytes(out)

    print(f"Processed {len(data)} bytes using key {key_hex}")

if __name__ == "__main__":
    main()

