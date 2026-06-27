#!/usr/bin/env python3

import sys
from pathlib import Path

# Encoded string location in the Natasha boot sector
START = 0x15A
END   = 0x18E      # one byte past the end


def decode_in_place(buf):
    """
    Decode the Natasha virus string in-place.

    Original code:
        DEC L
        LD A,(HL)
        XOR L

    which is equivalent to:
        decoded = encoded ^ (offset & 0xFF)

    The bytes are processed backwards by the virus, but the XOR itself is
    independent of direction.
    """

    for off in range(START, END):
        buf[off] ^= (off & 0xFF)


def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} input.vir output.vir")
        sys.exit(1)

    infile = Path(sys.argv[1])
    outfile = Path(sys.argv[2])

    data = bytearray(infile.read_bytes())

    decode_in_place(data)

    outfile.write_bytes(data)

    print(f"Wrote {outfile}")


if __name__ == "__main__":
    main()

