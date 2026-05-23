import sys
from pathlib import Path

def main():
    if len(sys.argv) != 2:
        print(f"Usage: {Path(sys.argv[0]).name} <inputfile>")
        sys.exit(1)

    infile = Path(sys.argv[1])
    outfile = infile.with_suffix(infile.suffix + ".decoded")

    data = infile.read_bytes()
    decoded = bytes(b & 0x7F for b in data)

    outfile.write_bytes(decoded)

    print(f"Decoded file written to: {outfile}")

if __name__ == "__main__":
    main()

