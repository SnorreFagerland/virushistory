#!/usr/bin/env python3
import sys
from pathlib import Path

START = 0x003E
WORDS = 0x01C2
KEY_ADDR = 0x03C2
DELTA = 0x01C1

def be16(buf, off):
    return (buf[off] << 8) | buf[off + 1]

def put_be16(buf, off, val):
    buf[off] = (val >> 8) & 0xFF
    buf[off + 1] = val & 0xFF

def decode(buf):
    pos = START
    key = be16(buf, KEY_ADDR)
    delta = DELTA

    for _ in range(WORDS):
        w = be16(buf, pos)
        put_be16(buf, pos, w ^ key)

        pos += 2
        key = (key + delta) & 0xFFFF
        delta = (delta - 1) & 0xFFFF

    return buf

def main():
    if len(sys.argv) not in (2, 3):
        print(f"Usage: {sys.argv[0]} <bootblock> [output]")
        sys.exit(1)

    inp = Path(sys.argv[1])
    out = Path(sys.argv[2]) if len(sys.argv) == 3 else inp.with_suffix(inp.suffix + ".decoded")

    data = bytearray(inp.read_bytes())

    if len(data) < 1024:
        print("[!] Warning: input is smaller than a normal Amiga boot block")

    decode(data)
    out.write_bytes(data)

    print(f"[+] Decoded {WORDS * 2} bytes")
    print(f"[+] Range: 0x{START:04X}-0x{START + WORDS * 2:04X}")
    print(f"[+] Initial key: 0x{be16(bytearray(inp.read_bytes()), KEY_ADDR):04X}")
    print(f"[+] Wrote: {out}")

if __name__ == "__main__":
    main()
