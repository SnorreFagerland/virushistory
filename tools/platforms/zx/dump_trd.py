#!/usr/bin/env python3

"""
extractor for ZX Spectrum TRD and SCL disk images

"""




import argparse
import json
import re
from pathlib import Path

SECTOR_SIZE = 256
TRD_SECTORS_PER_TRACK = 16
TRD_TRACK_SIZE = SECTOR_SIZE * TRD_SECTORS_PER_TRACK
TRD_DIR_ENTRIES = 128
TRD_DIR_ENTRY_SIZE = 16


def u16le(b):
    return b[0] | (b[1] << 8)


def clean_bytes(bs):
    return bytes(x if 32 <= x < 127 else ord("_") for x in bs)


def sanitize_name(s):
    s = s.strip().replace("\x00", "")
    s = re.sub(r'[<>:"/\\|?*\x00-\x1F]', "_", s)
    return s or "unnamed"


def trd_offset(track, sector):
    return track * TRD_TRACK_SIZE + sector * SECTOR_SIZE


def parse_trd(data):
    files = []

    for i in range(TRD_DIR_ENTRIES):
        off = i * TRD_DIR_ENTRY_SIZE
        e = data[off:off + TRD_DIR_ENTRY_SIZE]

        if len(e) < 16:
            break

        first = e[0]

        # 0x00 usually means no more entries.
        if first == 0x00:
            break

        # 0x01 is often deleted.
        deleted = first == 0x01

        name = clean_bytes(e[0:8]).decode("ascii", errors="replace").rstrip()
        ftype = chr(e[8]) if 32 <= e[8] < 127 else f"${e[8]:02X}"

        param1 = u16le(e[9:11])
        logical_len = u16le(e[11:13])
        sectors = e[13]
        start_sector = e[14]
        start_track = e[15]

        offset = trd_offset(start_track, start_sector)
        alloc_len = sectors * SECTOR_SIZE

        files.append({
            "index": i,
            "deleted": deleted,
            "name": name,
            "type": ftype,
            "param1": param1,
            "logical_len": logical_len,
            "sectors": sectors,
            "start_track": start_track,
            "start_sector": start_sector,
            "data_offset": offset,
            "allocated_len": alloc_len,
            "data": data[offset:offset + alloc_len],
            "dir_entry_hex": e.hex(" "),
        })

    return files


def parse_scl(data):
    if len(data) < 9 or data[:8] != b"SINCLAIR":
        raise ValueError("Not an SCL file: missing SINCLAIR header")

    count = data[8]
    cat_off = 9
    data_off = cat_off + count * 14

    files = []

    for i in range(count):
        off = cat_off + i * 14
        e = data[off:off + 14]

        if len(e) < 14:
            break

        name = clean_bytes(e[0:8]).decode("ascii", errors="replace").rstrip()
        ftype = chr(e[8]) if 32 <= e[8] < 127 else f"${e[8]:02X}"

        param1 = u16le(e[9:11])
        logical_len = u16le(e[11:13])
        sectors = e[13]
        alloc_len = sectors * SECTOR_SIZE

        payload = data[data_off:data_off + alloc_len]

        files.append({
            "index": i,
            "deleted": False,
            "name": name,
            "type": ftype,
            "param1": param1,
            "logical_len": logical_len,
            "sectors": sectors,
            "start_track": None,
            "start_sector": None,
            "data_offset": data_off,
            "allocated_len": alloc_len,
            "data": payload,
            "dir_entry_hex": e.hex(" "),
        })

        data_off += alloc_len

    return files


def write_files(files, outdir, logical_only=False, skip_deleted=True):
    outdir.mkdir(parents=True, exist_ok=True)

    manifest = []

    for f in files:
        if skip_deleted and f["deleted"]:
            continue

        base = sanitize_name(f["name"])
        typ = sanitize_name(f["type"])

        filename = f"{f['index']:03d}_{base}.{typ}.bin"
        path = outdir / filename

        payload = f["data"]

        if logical_only:
            payload = payload[:f["logical_len"]]

        path.write_bytes(payload)

        item = {k: v for k, v in f.items() if k != "data"}
        item["output_file"] = filename
        item["written_len"] = len(payload)

        # Useful anomaly marker.
        item["slack_bytes"] = max(0, f["allocated_len"] - f["logical_len"])

        manifest.append(item)

        print(
            f"[{f['index']:03d}] "
            f"{f['name']}.{f['type']}  "
            f"logical={f['logical_len']}  "
            f"allocated={f['allocated_len']}  "
            f"sectors={f['sectors']}  "
            f"offset=0x{f['data_offset']:X}  "
            f"-> {filename}"
        )

    (outdir / "manifest.json").write_text(
        json.dumps(manifest, indent=2),
        encoding="utf-8"
    )


def main():
    ap = argparse.ArgumentParser(
        description="Extract files from TR-DOS .trd and .scl images"
    )

    ap.add_argument("image", help="input .trd or .scl image")
    ap.add_argument("-o", "--outdir", help="output directory")
    ap.add_argument(
        "--logical-only",
        action="store_true",
        help="write only logical file length, not allocated sectors"
    )
    ap.add_argument(
        "--include-deleted",
        action="store_true",
        help="also extract deleted TRD entries"
    )

    args = ap.parse_args()

    image = Path(args.image)
    data = image.read_bytes()

    outdir = Path(args.outdir) if args.outdir else image.with_suffix("").with_name(image.stem + "_extracted")

    ext = image.suffix.lower()

    if ext == ".trd":
        files = parse_trd(data)
    elif ext == ".scl":
        files = parse_scl(data)
    else:
        if data[:8] == b"SINCLAIR":
            files = parse_scl(data)
        else:
            files = parse_trd(data)

    write_files(
        files,
        outdir,
        logical_only=args.logical_only,
        skip_deleted=not args.include_deleted,
    )

    print(f"\nWrote manifest: {outdir / 'manifest.json'}")


if __name__ == "__main__":
    main()

