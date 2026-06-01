#!/usr/bin/env python3
import argparse
import struct
from pathlib import Path

MAGIC = b"Archive\x00"

METHODS = {
    0x00: "end",
    0x01: "deleted",
    0x82: "stored",
    0x83: "packed",
    0x88: "crunched",
    0xFF: "compressed",
}

def u32(b, o):
    return struct.unpack_from("<I", b, o)[0]

def clean_name(raw):
    return raw.split(b"\x00", 1)[0].decode("latin-1", "replace")

def riscos_filetype(load):
    # RISC OS filetype is commonly encoded as &FFFtttxx in load address
    if (load & 0xFFF00000) == 0xFFF00000:
        return f"{(load >> 8) & 0xFFF:03X}"
    return None

def parse_arcfs(data):
    if not data.startswith(MAGIC):
        raise ValueError("Not an ArcFS Archive\\0 file")

    header_len = u32(data, 8)
    data_start = u32(data, 12)

    entries = []
    off = 96
    end = min(len(data), 96 + header_len)

    while off + 36 <= end:
        info = data[off]
        name = clean_name(data[off+1:off+12])

        if info == 0x00:
            break

        full_len = u32(data, off+12)
        load = u32(data, off+16)
        exec_addr = u32(data, off+20)
        attr = u32(data, off+24)
        comp_len = u32(data, off+28)
        infoword = u32(data, off+32)

        is_dir = bool(infoword & 0x80000000)
        payload_off = infoword & 0x7FFFFFFF

        entries.append({
            "offset": off,
            "method": info,
            "method_name": METHODS.get(info, f"unknown_{info:02X}"),
            "name": name,
            "full_len": full_len,
            "load": load,
            "exec": exec_addr,
            "attr": attr,
            "comp_len": comp_len,
            "is_dir": is_dir,
            "payload_off": payload_off,
            "filetype": riscos_filetype(load),
        })

        off += 36

    return header_len, data_start, entries

def safe_path(name):
    # RISC OS paths may use "." as separator. Do not aggressively convert it by default.
    name = name.replace("/", "_").replace("\\", "_").replace(":", "_")
    return name or "_unnamed"

def main():
    ap = argparse.ArgumentParser(description="Parse/list/extract RISC OS ArcFS Archive\\0 files")
    ap.add_argument("archive")
    ap.add_argument("-x", "--extract", action="store_true")
    ap.add_argument("-o", "--outdir", default="arcfs_out")
    ap.add_argument("--raw-compressed", action="store_true",
                    help="write compressed payloads too, with .compressed suffix")
    args = ap.parse_args()

    data = Path(args.archive).read_bytes()
    header_len, data_start, entries = parse_arcfs(data)

    print(f"Archive: {args.archive}")
    print(f"Header length: {header_len}")
    print(f"Data start:    {data_start}")
    print()

    outdir = Path(args.outdir)

    for i, e in enumerate(entries):
        ft = f",{e['filetype']}" if e["filetype"] else ""
        kind = "DIR " if e["is_dir"] else "FILE"
        print(
            f"{i:04d} {kind} "
            f"{e['method_name']:10s} "
            f"full={e['full_len']:10d} comp={e['comp_len']:10d} "
            f"load=&{e['load']:08X}{ft} exec=&{e['exec']:08X} "
            f"data_off={e['payload_off']:08X} "
            f"name={e['name']!r}"
        )

        if args.extract and not e["is_dir"]:
            start = data_start + e["payload_off"]
            end = start + e["comp_len"]

            if start < 0 or end > len(data):
                print(f"  [!] payload outside file bounds, skipping")
                continue

            payload = data[start:end]
            outdir.mkdir(parents=True, exist_ok=True)

            filename = safe_path(e["name"])
            outpath = outdir / filename

            if e["method"] == 0x82:
                outpath.write_bytes(payload)
                print(f"  [+] extracted stored file: {outpath}")
            elif args.raw_compressed:
                outpath = outdir / (filename + f".{e['method_name']}.compressed")
                outpath.write_bytes(payload)
                print(f"  [+] wrote raw compressed payload: {outpath}")
            else:
                print(f"  [!] not extracted: compression method {e['method_name']}")

if __name__ == "__main__":
    main()

