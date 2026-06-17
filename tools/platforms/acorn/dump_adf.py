#!/usr/bin/env python3
import sys
import struct
from pathlib import Path

SECTOR = 256
ENTRY_SIZE = 26

OLD_DIR = "old"
NEW_DIR = "new"


def u24le(b, o):
    return b[o] | (b[o + 1] << 8) | (b[o + 2] << 16)


def u32le(b, o):
    return struct.unpack_from("<I", b, o)[0]


def clean_name(raw):
    out = []
    for c in raw:
        c &= 0x7F
        if c < 32:
            break
        out.append(c)
    return bytes(out).decode("latin-1", "replace").strip()


def filetype(load):
    if (load & 0xFFF00000) == 0xFFF00000:
        return f"{(load >> 8) & 0xFFF:03X}"
    return "----"


def is_dir_marker(data, off):
    return off + 5 <= len(data) and data[off + 1:off + 5] in (b"Hugo", b"Nick")


def detect_dir_at(data, off):
    if not is_dir_marker(data, off):
        return None

    if off + 2048 <= len(data) and data[off + 2043:off + 2047] in (b"Hugo", b"Nick"):
        return NEW_DIR, 2048, 77

    if off + 1280 <= len(data) and data[off + 1275:off + 1279] in (b"Hugo", b"Nick"):
        return OLD_DIR, 1280, 47

    return None


def scan_dir_blocks(data):
    dirs = {}
    for off in range(0, len(data) - 5, SECTOR):
        detected = detect_dir_at(data, off)
        if detected:
            dirs[off] = detected
    return dirs


def dir_tail_name(data, off, dtype, size):
    block = data[off:off + size]

    candidates = []

    if dtype == NEW_DIR:
        # NewDirName is near the tail. Try tolerant windows.
        candidates.extend([
            block[size - 0x10:size - 0x06],
            block[size - 0x20:size - 0x16],
            block[size - 0x29:size - 0x1F],
        ])
    else:
        candidates.extend([
            block[size - 0x2A:size - 0x20],
            block[size - 0x35:size - 0x2B],
        ])

    for raw in candidates:
        name = clean_name(raw)
        if name:
            return name

    return ""


class ADFSImage:
    def __init__(self, data):
        self.data = data
        self.dir_blocks = scan_dir_blocks(data)

        if not self.dir_blocks:
            raise ValueError("No ADFS/FileCore directory blocks found")

        self.root_off = self.find_root()

    def find_root(self):
        for off in (0x200, 0x400, 0x800, 0x000, 0xC00):
            if off in self.dir_blocks:
                return off

        return min(self.dir_blocks.keys())

    def parse_dir_block(self, dir_off):
        dtype, size, max_entries = self.dir_blocks[dir_off]
        block = self.data[dir_off:dir_off + size]
        entries = []

        for i in range(max_entries):
            off = 5 + i * ENTRY_SIZE
            if off + ENTRY_SIZE > len(block):
                break

            name = clean_name(block[off:off + 10])
            if not name:
                break

            load = u32le(block, off + 0x0A)
            exec_addr = u32le(block, off + 0x0E)
            length = u32le(block, off + 0x12)
            obj_addr = u24le(block, off + 0x16)
            attr = block[off + 0x19]

            is_dir = bool(attr & 0x08)

            entries.append({
                "name": name,
                "load": load,
                "exec": exec_addr,
                "size": length,
                "addr": obj_addr,
                "attr": attr,
                "is_dir": is_dir,
                "type": filetype(load),
            })

        return entries

    def resolve_dir_by_address(self, obj_addr):
        candidates = [
            obj_addr,
            obj_addr * SECTOR,
            (obj_addr & 0x1FFFFF) * SECTOR,
            (obj_addr >> 8) * SECTOR,
            obj_addr & ~0xFF,
        ]

        for c in candidates:
            if c in self.dir_blocks:
                return c

        return None

    def resolve_dir_by_name(self, wanted_name, used_offsets):
        wanted = wanted_name.lower()
        matches = []

        for off, (dtype, size, _entries) in self.dir_blocks.items():
            if off in used_offsets:
                continue

            tail_name = dir_tail_name(self.data, off, dtype, size)

            if tail_name.lower() == wanted:
                matches.append(off)

        if len(matches) == 1:
            return matches[0]

        return None

    def walk(self):
        results = []
        seen = set()

        def rec(dir_off, path):
            if dir_off in seen:
                return
            seen.add(dir_off)

            for e in self.parse_dir_block(dir_off):
                full_path = f"{path}.{e['name']}" if path != "$" else f"$.{e['name']}"

                child_off = None

                if e["is_dir"]:
                    child_off = self.resolve_dir_by_address(e["addr"])

                    if child_off is None:
                        child_off = self.resolve_dir_by_name(e["name"], seen)

                    results.append({
                        "path": full_path,
                        "type": e["type"],
                        "size": e["size"],
                        "kind": "DIR",
                        "addr": e["addr"],
                        "load": e["load"],
                        "exec": e["exec"],
                        "attr": e["attr"],
                    })

                    if child_off is not None:
                        rec(child_off, full_path)
                    else:
                        results.append({
                            "path": full_path + ".[UNRESOLVED_DIR]",
                            "type": "----",
                            "size": 0,
                            "kind": "WARN",
                            "addr": e["addr"],
                            "load": 0,
                            "exec": 0,
                            "attr": 0,
                        })

                else:
                    results.append({
                        "path": full_path,
                        "type": e["type"],
                        "size": e["size"],
                        "kind": "FILE",
                        "addr": e["addr"],
                        "load": e["load"],
                        "exec": e["exec"],
                        "attr": e["attr"],
                    })

        rec(self.root_off, "$")
        return results


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {Path(sys.argv[0]).name} image.adf")
        sys.exit(1)

    data = Path(sys.argv[1]).read_bytes()
    img = ADFSImage(data)

    print(f"Root directory offset: 0x{img.root_off:X}")
    print(f"Directory blocks found: {len(img.dir_blocks)}\n")

    print(f"{'Path':<60} {'Type':<5} {'Size':>10} {'Kind':<5} {'Addr':>8}")
    print("-" * 95)

    for e in img.walk():
        print(
            f"{e['path']:<60} "
            f"{e['type']:<5} "
            f"{e['size']:>10} "
            f"{e['kind']:<5} "
            f"{e['addr']:06X}"
        )


if __name__ == "__main__":
    main()
