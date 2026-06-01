#!/usr/bin/env python3
"""
extract_acorn_adf_filecore.py

Extract files from Acorn/RISC OS ADFS/FileCore floppy images.

This version fixes the common mistake of treating the 24-bit object address in
directory entries as a physical image offset. In FileCore-style directories the
object address is an indirect address: the high part identifies an allocation
fragment/object, and the low byte is an offset within that fragment. The actual
byte offset must be resolved through the disk allocation layout.

The script recovers enough of that layout for typical 800K/1600K floppy images
by:
  * scanning all Hugo/Nick NewDir/OldDir directory blocks;
  * matching directory entries to directory blocks by their tail names;
  * using those directory blocks as physical anchors for fragment IDs;
  * interpolating the file fragment bases between anchors using object sizes.

It is still pragmatic rather than a full FileCore implementation, but it fixes
cases where !Boot files came out as garbage because addr 000401 was read from
0x40100 instead of the real physical offset.
"""

from __future__ import annotations

import argparse
import json
import math
import re
import struct
from collections import defaultdict
from pathlib import Path
from typing import Any

SECTOR = 256
ENTRY_SIZE = 26
DEFAULT_LFAU = 1024

OLD_DIR = "old"
NEW_DIR = "new"


class ADFSError(Exception):
    pass


def u24le(b: bytes | bytearray, o: int) -> int:
    return b[o] | (b[o + 1] << 8) | (b[o + 2] << 16)


def u32le(b: bytes | bytearray, o: int) -> int:
    return struct.unpack_from("<I", b, o)[0]


def clean_name(raw: bytes | bytearray) -> str:
    out: list[int] = []
    for c in raw:
        c &= 0x7F
        if c < 32:
            break
        out.append(c)
    return bytes(out).decode("latin-1", "replace").strip()


def filetype(load: int) -> str:
    if (load & 0xFFF00000) == 0xFFF00000:
        return f"{(load >> 8) & 0xFFF:03X}"
    return "----"


def is_dir_marker(data: bytes, off: int) -> bool:
    return off + 5 <= len(data) and data[off + 1:off + 5] in (b"Hugo", b"Nick")


def detect_dir_at(data: bytes, off: int) -> tuple[str, int, int] | None:
    if not is_dir_marker(data, off):
        return None
    if off + 2048 <= len(data) and data[off + 2043:off + 2047] in (b"Hugo", b"Nick"):
        return NEW_DIR, 2048, 77
    if off + 1280 <= len(data) and data[off + 1275:off + 1279] in (b"Hugo", b"Nick"):
        return OLD_DIR, 1280, 47
    return None


def scan_dir_blocks(data: bytes) -> dict[int, tuple[str, int, int]]:
    dirs: dict[int, tuple[str, int, int]] = {}
    for off in range(0, len(data) - 5, SECTOR):
        detected = detect_dir_at(data, off)
        if detected:
            dirs[off] = detected
    return dirs


def dir_tail_name(data: bytes, off: int, dtype: str, size: int) -> str:
    block = data[off:off + size]
    candidates: list[bytes] = []
    if dtype == NEW_DIR:
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


def safe_component(name: str) -> str:
    name = re.sub(r'[<>:"/\\|?*\x00-\x1f]', "_", name.strip()).rstrip(" .")
    if not name:
        name = "unnamed"
    if name.upper() in {"CON", "PRN", "AUX", "NUL", *(f"COM{i}" for i in range(1, 10)), *(f"LPT{i}" for i in range(1, 10))}:
        name = "_" + name
    return name


def riscos_path_parts(path: str) -> list[str]:
    if path == "$":
        return []
    if path.startswith("$."):
        path = path[2:]
    elif path.startswith("$"):
        path = path[1:]
    return [p for p in path.split(".") if p]


def unique_path(path: Path) -> Path:
    if not path.exists():
        return path
    for i in range(1, 100000):
        p = path.parent / f"{path.name}.__dup{i}"
        if not p.exists():
            return p
    raise ADFSError(f"Could not allocate unique filename for {path}")


class ADFSImage:
    def __init__(self, data: bytes, lfau: int = DEFAULT_LFAU):
        self.data = data
        self.lfau = lfau
        self.dir_blocks = scan_dir_blocks(data)
        if not self.dir_blocks:
            raise ADFSError("No ADFS/FileCore directory blocks found")
        self.root_off = self.find_root()
        self._all_entries = self.parse_all_dir_blocks()
        self.fragment_units = self.compute_fragment_units()
        self.fragment_bases = self.build_fragment_base_map()

    def find_root(self) -> int:
        for off in (0x800, 0x400, 0x200, 0x000, 0xC00):
            if off in self.dir_blocks:
                return off
        return min(self.dir_blocks)

    def parse_dir_block(self, dir_off: int) -> list[dict[str, Any]]:
        dtype, size, max_entries = self.dir_blocks[dir_off]
        block = self.data[dir_off:dir_off + size]
        entries: list[dict[str, Any]] = []
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
            entries.append({
                "name": name,
                "load": load,
                "exec": exec_addr,
                "size": length,
                "addr": obj_addr,
                "fragment_id": obj_addr >> 8,
                "fragment_low": obj_addr & 0xFF,
                "attr": attr,
                "is_dir": bool(attr & 0x08),
                "type": filetype(load),
                "entry_index": i,
                "dir_offset": dir_off,
            })
        return entries

    def parse_all_dir_blocks(self) -> list[dict[str, Any]]:
        out: list[dict[str, Any]] = []
        for off in sorted(self.dir_blocks):
            out.extend(self.parse_dir_block(off))
        return out

    def compute_fragment_units(self) -> dict[int, int]:
        units: dict[int, int] = defaultdict(int)
        for e in self._all_entries:
            fid = e["fragment_id"]
            low = e["fragment_low"]
            # In the observed FileCore directory form, low byte 0 means start of
            # fragment; low byte 1 also means start of first file slot, low 2 is
            # +1 LFAU, etc.
            offset_units = low - 1 if low > 0 else 0
            size_units = math.ceil(e["size"] / self.lfau) if e["size"] else 0
            units[fid] = max(units[fid], offset_units + size_units)
        return dict(units)

    def directory_anchors(self) -> dict[int, int]:
        """Return fragment_id -> physical directory offset for directory objects."""
        entries_by_name: dict[str, list[dict[str, Any]]] = defaultdict(list)
        blocks_by_tail: dict[str, list[int]] = defaultdict(list)

        for e in self._all_entries:
            if e["is_dir"]:
                entries_by_name[e["name"].lower()].append(e)

        for off, (dtype, size, _max_entries) in self.dir_blocks.items():
            if off == self.root_off:
                continue
            tail = dir_tail_name(self.data, off, dtype, size)
            if tail:
                blocks_by_tail[tail.lower()].append(off)

        anchors: dict[int, int] = {}
        for name, entries in entries_by_name.items():
            blocks = blocks_by_tail.get(name, [])
            if not blocks:
                continue
            entries = sorted(entries, key=lambda e: (e["fragment_id"], e["dir_offset"], e["entry_index"]))
            blocks = sorted(blocks)
            if len(entries) == len(blocks):
                for e, off in zip(entries, blocks):
                    anchors[e["fragment_id"]] = off
            elif len(entries) == 1 and len(blocks) == 1:
                anchors[entries[0]["fragment_id"]] = blocks[0]

        return anchors

    def build_fragment_base_map(self) -> dict[int, int]:
        anchors = self.directory_anchors()
        if not anchors:
            raise ADFSError("Could not derive any directory/address anchors")

        # Fill between physical directory anchors.  Padding/slack is left just
        # before the next anchor; this preserves starts of files in the interval.
        ids = sorted(fid for fid in self.fragment_units if fid != 0)
        known = sorted((fid, off) for fid, off in anchors.items() if fid in self.fragment_units)
        bases: dict[int, int] = dict(anchors)

        for (fid_a, off_a), (fid_b, off_b) in zip(known, known[1:]):
            cur = off_a
            for fid in range(fid_a, fid_b):
                if fid in self.fragment_units:
                    bases.setdefault(fid, cur)
                    cur += self.fragment_units[fid] * self.lfau
            bases[fid_b] = off_b

        # Fill before first and after last anchor where possible.
        first_fid, first_off = known[0]
        cur = first_off
        for fid in range(first_fid - 1, min(ids) - 1, -1):
            if fid in self.fragment_units:
                cur -= self.fragment_units[fid] * self.lfau
                if cur >= 0:
                    bases.setdefault(fid, cur)

        last_fid, last_off = known[-1]
        cur = last_off
        for fid in range(last_fid, max(ids) + 1):
            if fid in self.fragment_units:
                bases.setdefault(fid, cur)
                cur = bases[fid] + self.fragment_units[fid] * self.lfau

        return bases

    def object_offset(self, obj_addr: int) -> int | None:
        fid = obj_addr >> 8
        low = obj_addr & 0xFF
        base = self.fragment_bases.get(fid)
        if base is None:
            return None
        offset_units = low - 1 if low > 0 else 0
        return base + offset_units * self.lfau

    def resolve_dir_by_address(self, obj_addr: int) -> int | None:
        off = self.object_offset(obj_addr)
        if off in self.dir_blocks:
            return off
        return None

    def walk(self) -> list[dict[str, Any]]:
        results: list[dict[str, Any]] = []
        seen: set[int] = set()

        def rec(dir_off: int, path: str) -> None:
            if dir_off in seen:
                return
            seen.add(dir_off)
            for e in self.parse_dir_block(dir_off):
                full_path = f"{path}.{e['name']}" if path != "$" else f"$.{e['name']}"
                image_off = self.object_offset(e["addr"])
                item = {
                    "path": full_path,
                    "type": e["type"],
                    "size": e["size"],
                    "kind": "DIR" if e["is_dir"] else "FILE",
                    "addr": e["addr"],
                    "fragment_id": e["fragment_id"],
                    "fragment_low": e["fragment_low"],
                    "load": e["load"],
                    "exec": e["exec"],
                    "attr": e["attr"],
                    "image_offset": image_off,
                }
                results.append(item)
                if e["is_dir"]:
                    child = self.resolve_dir_by_address(e["addr"])
                    if child is not None:
                        rec(child, full_path)
                    else:
                        results.append({
                            "path": full_path + ".[UNRESOLVED_DIR]",
                            "type": "----",
                            "size": 0,
                            "kind": "WARN",
                            "addr": e["addr"],
                            "fragment_id": e["fragment_id"],
                            "fragment_low": e["fragment_low"],
                            "load": 0,
                            "exec": 0,
                            "attr": 0,
                            "image_offset": image_off,
                            "warning": "Directory address did not resolve to a scanned Hugo/Nick directory block",
                        })
        rec(self.root_off, "$")
        return results

    def extract(self, out_dir: Path, raw_names: bool = False, metadata: bool = True, verbose: bool = True) -> dict[str, Any]:
        out_dir.mkdir(parents=True, exist_ok=True)
        manifest: dict[str, Any] = {
            "image_size": len(self.data),
            "lfau": self.lfau,
            "root_directory_offset": self.root_off,
            "directory_blocks_found": len(self.dir_blocks),
            "fragment_bases": {f"0x{k:02X}": f"0x{v:X}" for k, v in sorted(self.fragment_bases.items())},
            "objects": [],
            "warnings": [],
        }
        for e in self.walk():
            item = dict(e)
            item["load_hex"] = f"0x{e['load']:08X}"
            item["exec_hex"] = f"0x{e['exec']:08X}"
            item["attr_hex"] = f"0x{e['attr']:02X}"
            item["addr_hex"] = f"0x{e['addr']:06X}"
            item["image_offset_hex"] = None if e.get("image_offset") is None else f"0x{e['image_offset']:X}"

            parts = [safe_component(p) for p in riscos_path_parts(e["path"])]
            if e["kind"] == "DIR":
                if parts:
                    (out_dir / Path(*parts)).mkdir(parents=True, exist_ok=True)
                item["output"] = str(Path(*parts)) if parts else "."
            elif e["kind"] == "FILE":
                if not parts:
                    continue
                parent = out_dir / Path(*parts[:-1]) if len(parts) > 1 else out_dir
                parent.mkdir(parents=True, exist_ok=True)
                leaf = parts[-1]
                if not raw_names and e["type"] != "----":
                    leaf = f"{leaf},{e['type'].lower()}"
                out_path = unique_path(parent / leaf)
                item["output"] = str(out_path.relative_to(out_dir))
                off = e.get("image_offset")
                size = e["size"]
                if off is None or off < 0 or off + size > len(self.data):
                    warning = "Could not resolve file physical offset"
                    item["warning"] = warning
                    manifest["warnings"].append({"path": e["path"], "addr": item["addr_hex"], "warning": warning})
                else:
                    out_path.write_bytes(self.data[off:off + size])
                    if verbose:
                        print(f"[+] {e['path']} -> {out_path} ({size} bytes @ 0x{off:X})")
            elif e["kind"] == "WARN":
                manifest["warnings"].append({"path": e["path"], "warning": e.get("warning", "warning")})
            manifest["objects"].append(item)

        if metadata:
            meta = out_dir / "_adfs_manifest.json"
            meta.write_text(json.dumps(manifest, indent=2), encoding="utf-8")
            if verbose:
                print(f"[+] Manifest -> {meta}")
        return manifest


def print_listing(img: ADFSImage) -> None:
    print(f"Root directory offset: 0x{img.root_off:X}")
    print(f"Directory blocks found: {len(img.dir_blocks)}")
    print(f"Fragment bases recovered: {len(img.fragment_bases)}\n")
    print(f"{'Path':<60} {'Type':<5} {'Size':>10} {'Kind':<5} {'Addr':>8} {'Offset':>10}")
    print("-" * 108)
    for e in img.walk():
        off = "?" if e.get("image_offset") is None else f"{e['image_offset']:X}"
        print(f"{e['path']:<60} {e['type']:<5} {e['size']:>10} {e['kind']:<5} {e['addr']:06X} {off:>10}")


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="List/extract Acorn Archimedes ADFS/FileCore floppy images")
    ap.add_argument("image", type=Path)
    ap.add_argument("-o", "--output", type=Path, help="output dir; default <image>.extracted")
    ap.add_argument("--list-only", action="store_true")
    ap.add_argument("--raw-names", action="store_true", help="do not append ,xxx RISC OS filetype suffix")
    ap.add_argument("--no-metadata", action="store_true")
    ap.add_argument("--quiet", action="store_true")
    ap.add_argument("--lfau", type=lambda x: int(x, 0), default=DEFAULT_LFAU, help="logical file allocation unit, default 1024")
    args = ap.parse_args(argv)

    img = ADFSImage(args.image.read_bytes(), lfau=args.lfau)
    print_listing(img)
    if args.list_only:
        return 0
    out = args.output or args.image.with_suffix(args.image.suffix + ".extracted")
    print(f"\nExtracting to: {out}")
    manifest = img.extract(out, raw_names=args.raw_names, metadata=not args.no_metadata, verbose=not args.quiet)
    files = sum(1 for o in manifest["objects"] if o.get("kind") == "FILE" and not o.get("warning"))
    warnings = len(manifest["warnings"])
    print(f"\nDone. Extracted files: {files}; warnings: {warnings}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
