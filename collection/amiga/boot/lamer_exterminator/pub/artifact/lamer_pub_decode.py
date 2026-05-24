#!/usr/bin/env python3
from pathlib import Path
import argparse

def decode_bootblock(buf: bytearray) -> bytearray:
    if len(buf) < 1024:
        raise ValueError("Expected a 1024-byte Amiga bootblock")

    start = 0x4E
    count = 0x353
    xor_key = 0xAB
    add_key = buf[0x3A1]

    out = bytearray(buf)

    for i in range(count):
        b = out[start + i]
        b = ((b + add_key) & 0xFF) ^ xor_key
        out[start + i] = b

    return out

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("input")
    ap.add_argument("output")
    args = ap.parse_args()

    data = bytearray(Path(args.input).read_bytes())
    decoded = decode_bootblock(data)
    Path(args.output).write_bytes(decoded)

    print(f"decoded {args.input} -> {args.output}")
    print("decoded region: 0x004e-0x03a0")
    print(f"add key: 0x{data[0x3A1]:02x}")
    print("xor key: 0xab")

if __name__ == "__main__":
    main()

