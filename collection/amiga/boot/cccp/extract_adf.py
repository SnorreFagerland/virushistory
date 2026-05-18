#!/usr/bin/env python3
import argparse
import os
import struct
import hashlib
from pathlib import Path

BLOCK = 512
ADF_SIZE_880K = 901120
ROOT_BLOCK = 880

ST_ROOT = 1
ST_USERDIR = 2
ST_FILE = -3

def u32(b, n):
    return struct.unpack_from(">I", b, n * 4)[0]

def s32(b, n):
    return struct.unpack_from(">i", b, n * 4)[0]

def bstr(block, offset, maxlen):
    ln = block[offset]
    if ln > maxlen - 1:
        ln = maxlen - 1
    return block[offset + 1:offset + 1 + ln].decode("latin-1", errors="replace")

def safe_name(name):
    bad = '<>:"/\\|?*'
    name = "".join("_" if c in bad or ord(c) < 32 else c for c in name)
    return name.strip() or "_unnamed_"

class ADF:
    def __init__(self, path):
        self.path = Path(path)
        self.data = self.path.read_bytes()
        self.blocks = len(self.data) // BLOCK

    def block(self, n):
        if n < 0 or n >= self.blocks:
            raise ValueError(f"Block out of range: {n}")
        return self.data[n * BLOCK:(n + 1) * BLOCK]

    def checksum_ok(self, n):
        b = bytearray(self.block(n))
        stored = s32(b, 5)
        b[20:24] = b"\x00\x00\x00\x00"
        total = 0
        for i in range(0, BLOCK, 4):
            total = (total + struct.unpack_from(">I", b, i)[0]) & 0xffffffff
        calc = (-total) & 0xffffffff
        return calc == (stored & 0xffffffff)

    def fs_id(self):
        return self.data[:4]

    def is_ffs(self):
        fs = self.fs_id()
        return fs.startswith(b"DOS") and fs[3] in (1, 3, 5)

    def hash_table(self, block):
        # Standard 512-byte AmigaDOS root/dir hash table: longwords 6..77 inclusive.
        return [u32(block, i) for i in range(6, 78)]

    def header_name(self, block):
        # File/dir/root name field at longword -20, byte offset 432.
        return bstr(block, 432, 32)

    def parse_header(self, blknum):
        b = self.block(blknum)
        return {
            "block": blknum,
            "type": s32(b, 0),
            "name": self.header_name(b),
            "size": u32(b, 81),
            "hash_chain": u32(b, 124),
            "parent": u32(b, 125),
            "extension": u32(b, 126),
            "subtype": s32(b, 127),
            "checksum_ok": self.checksum_ok(blknum),
            "data_ptrs": [u32(b, i) for i in range(6, 78) if u32(b, i)],
        }

    def walk_dir(self, dir_block, outdir, seen=None):
        if seen is None:
            seen = set()
        if dir_block in seen:
            print(f"[!] Directory loop at block {dir_block}")
            return
        seen.add(dir_block)

        b = self.block(dir_block)
        for head in self.hash_table(b):
            cur = head
            while cur:
                h = self.parse_header(cur)
                name = safe_name(h["name"])
                subtype = h["subtype"]

                if subtype == ST_USERDIR:
                    target = outdir / name
                    target.mkdir(parents=True, exist_ok=True)
                    print(f"[DIR ] {target}  block={cur}")
                    self.walk_dir(cur, target, seen)

                elif subtype == ST_FILE:
                    target = outdir / name
                    print(f"[FILE] {target}  size={h['size']}  block={cur}")
                    blob = self.read_file(h)
                    target.write_bytes(blob)

                else:
                    print(f"[SKIP] block={cur} name={name!r} subtype={subtype}")

                cur = h["hash_chain"]

    def all_file_data_ptrs(self, header):
        ptrs = list(header["data_ptrs"])

        ext = header["extension"]
        seen = set()
        while ext:
            if ext in seen:
                print(f"[!] Extension block loop at {ext}")
                break
            seen.add(ext)

            b = self.block(ext)
            ext_ptrs = [u32(b, i) for i in range(6, 78) if u32(b, i)]
            ptrs.extend(ext_ptrs)
            ext = u32(b, 126)

        # AmigaDOS commonly stores these in reverse order.
        return list(reversed(ptrs))

    def read_file(self, header):
        want = header["size"]
        out = bytearray()
        ptrs = self.all_file_data_ptrs(header)

        if self.is_ffs():
            for p in ptrs:
                out.extend(self.block(p))
                if len(out) >= want:
                    break
        else:
            # OFS data blocks contain a 24-byte header, then payload.
            for p in ptrs:
                b = self.block(p)
                data_size = u32(b, 3)
                payload = b[24:24 + min(data_size, BLOCK - 24)]
                out.extend(payload)
                if len(out) >= want:
                    break

        return bytes(out[:want])

def main():
    ap = argparse.ArgumentParser(description="Extract boot block and AmigaDOS files from an ADF image.")
    ap.add_argument("adf", help="Input .adf file")
    ap.add_argument("-o", "--out", default="adf_out", help="Output folder")
    args = ap.parse_args()

    adf = ADF(args.adf)
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    print(f"[+] Input: {args.adf}")
    print(f"[+] Size: {len(adf.data)} bytes, {adf.blocks} blocks")
    print(f"[+] SHA256: {hashlib.sha256(adf.data).hexdigest()}")

    fs = adf.fs_id()
    print(f"[+] Boot/filesystem ID: {fs!r}")

    boot_path = out / "bootblock_0000_1024.bin"
    boot_path.write_bytes(adf.data[:1024])
    print(f"[+] Wrote boot block: {boot_path}")

    if not fs.startswith(b"DOS"):
        print("[!] No AmigaDOS signature in boot block. Likely custom/game disk. Filesystem extraction skipped.")
        return

    print(f"[+] Filesystem flavor: {'FFS' if adf.is_ffs() else 'OFS'}")

    try:
        root = adf.parse_header(ROOT_BLOCK)
    except Exception as e:
        print(f"[!] Could not parse root block {ROOT_BLOCK}: {e}")
        return

    print(f"[+] Root block checksum ok: {root['checksum_ok']}")
    print(f"[+] Volume name: {root['name']!r}")

    files_out = out / safe_name(root["name"] or "volume")
    files_out.mkdir(parents=True, exist_ok=True)

    adf.walk_dir(ROOT_BLOCK, files_out)
    print("[+] Done.")

if __name__ == "__main__":
    main()

