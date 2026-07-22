#!/usr/bin/env python3
"""
d88_x68_extractor.py - D88/X68000 sector dumper and Human68k/FAT12 extractor.

This is designed for malware/virus archaeology:
  * parses one or more concatenated D88 disk images
  * dumps D88 metadata and every sector if requested
  * reconstructs a raw sector-order image where possible
  * extracts Human68k / FAT12 files when a DOS-like BPB is present
  * always dumps IPL / first sectors for boot-virus comparison

Usage examples:
  python d88_x68_extractor.py disk.d88 -o out --info --raw --extract-files
  python d88_x68_extractor.py disk.d88 -o out --dump-sectors --ipl-bytes 8192
  python d88_x68_extractor.py *.d88 -o corpus_out --info

Notes:
  D88 is a sector container, not a filesystem. Many protected/boot-only disks
  will not have an extractable FAT filesystem. Sector dumps still work.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import struct
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple


D88_HEADER_SIZE = 0x2B0  # 688 bytes: 0x20 + 164*4
D88_SECTOR_HEADER_SIZE = 16


def le16(b: bytes, off: int) -> int:
    return struct.unpack_from('<H', b, off)[0]


def le32(b: bytes, off: int) -> int:
    return struct.unpack_from('<I', b, off)[0]


def sha256_hex(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def decode_sjis(raw: bytes) -> str:
    raw = raw.rstrip(b'\x00 \x20')
    try:
        return raw.decode('shift_jis', errors='replace')
    except Exception:
        return raw.decode('latin-1', errors='replace')


def safe_name(name: str, fallback: str = 'unnamed') -> str:
    name = name.strip().replace('\\', '_').replace('/', '_').replace(':', '_')
    name = re.sub(r'[\x00-\x1f<>"|?*]+', '_', name)
    name = name.strip(' .')
    return name or fallback


@dataclass
class D88Sector:
    file_offset: int
    c: int
    h: int
    r: int
    n: int
    sectors_on_track: int
    density: int
    deleted: int
    status: int
    actual_size: int
    data: bytes

    @property
    def expected_size(self) -> int:
        return 128 << self.n if self.n <= 7 else self.actual_size

    def summary(self) -> dict:
        return {
            'file_offset': self.file_offset,
            'c': self.c,
            'h': self.h,
            'r': self.r,
            'n': self.n,
            'expected_size': self.expected_size,
            'actual_size': self.actual_size,
            'sectors_on_track': self.sectors_on_track,
            'density': self.density,
            'deleted': self.deleted,
            'status': self.status,
            'sha256': sha256_hex(self.data),
        }


@dataclass
class D88Disk:
    index: int
    file_start: int
    name: str
    write_protect: int
    media_flag: int
    disk_size: int
    track_offsets: List[int]
    sectors: List[D88Sector]

    def summary(self) -> dict:
        sizes = sorted(set(s.actual_size for s in self.sectors))
        statuses = sorted(set(s.status for s in self.sectors))
        return {
            'index': self.index,
            'file_start': self.file_start,
            'name': self.name,
            'write_protect': self.write_protect,
            'media_flag': self.media_flag,
            'disk_size': self.disk_size,
            'sector_count': len(self.sectors),
            'sector_sizes': sizes,
            'fdc_statuses': statuses,
            'sha256_all_sector_data': sha256_hex(b''.join(s.data for s in sorted(self.sectors, key=lambda x: (x.c, x.h, x.r, x.file_offset)))),
        }


def parse_d88_file(path: Path) -> List[D88Disk]:
    blob = path.read_bytes()
    disks: List[D88Disk] = []
    pos = 0
    idx = 0
    while pos + D88_HEADER_SIZE <= len(blob):
        header = blob[pos:pos + D88_HEADER_SIZE]
        name = decode_sjis(header[0:16])
        write_protect = header[0x1A]
        media_flag = header[0x1B]
        disk_size = le32(header, 0x1C)
        if disk_size <= 0 or pos + disk_size > len(blob):
            # Stop rather than guessing. Some malformed files may still be useful,
            # but this avoids interpreting random trailing data as a disk.
            break
        track_offsets = [le32(header, 0x20 + i * 4) for i in range(164)]
        sectors: List[D88Sector] = []
        for toff in track_offsets:
            if toff == 0:
                continue
            abs_off = pos + toff
            if abs_off < pos + D88_HEADER_SIZE or abs_off >= pos + disk_size:
                continue
            cur = abs_off
            first = True
            max_track_end = pos + disk_size
            # Sector headers contain sectors_on_track. We use it to limit the loop.
            sector_limit = None
            count = 0
            while cur + D88_SECTOR_HEADER_SIZE <= max_track_end:
                sh = blob[cur:cur + D88_SECTOR_HEADER_SIZE]
                c, h, r, n = sh[0], sh[1], sh[2], sh[3]
                sectors_on_track = le16(sh, 4)
                density = sh[6]
                deleted = sh[7]
                status = sh[8]
                actual_size = le16(sh, 14)
                if actual_size <= 0 or cur + 16 + actual_size > max_track_end:
                    break
                if first:
                    sector_limit = sectors_on_track if sectors_on_track > 0 else None
                    first = False
                data = blob[cur + 16:cur + 16 + actual_size]
                sectors.append(D88Sector(cur, c, h, r, n, sectors_on_track, density, deleted, status, actual_size, data))
                cur += 16 + actual_size
                count += 1
                if sector_limit is not None and count >= sector_limit:
                    break
        disks.append(D88Disk(idx, pos, name, write_protect, media_flag, disk_size, track_offsets, sectors))
        pos += disk_size
        idx += 1
    return disks


def reconstruct_raw(disk: D88Disk, pad_missing: bool = False, fill: int = 0xE5) -> bytes:
    """Return sectors in C/H/R order. For standard disks this is a usable raw image."""
    sectors = sorted(disk.sectors, key=lambda s: (s.c, s.h, s.r, s.file_offset))
    if not sectors:
        return b''
    common_size = max(set([s.actual_size for s in sectors]), key=[s.actual_size for s in sectors].count)
    out = bytearray()
    last_key = None
    for s in sectors:
        key = (s.c, s.h, s.r)
        if key == last_key:
            # Duplicate sector ID; keep both in raw stream rather than dropping data.
            pass
        data = s.data
        if len(data) < common_size:
            data = data + bytes([fill]) * (common_size - len(data))
        out += data[:common_size]
        last_key = key
    return bytes(out)


@dataclass
class BPB:
    bytes_per_sector: int
    sectors_per_cluster: int
    reserved_sectors: int
    fats: int
    root_entries: int
    total_sectors: int
    media: int
    sectors_per_fat: int
    sectors_per_track: int
    heads: int
    hidden_sectors: int

    @property
    def root_dir_sectors(self) -> int:
        return ((self.root_entries * 32) + (self.bytes_per_sector - 1)) // self.bytes_per_sector

    @property
    def first_root_sector(self) -> int:
        return self.reserved_sectors + self.fats * self.sectors_per_fat

    @property
    def first_data_sector(self) -> int:
        return self.first_root_sector + self.root_dir_sectors


def parse_bpb(raw: bytes) -> Optional[BPB]:
    if len(raw) < 64:
        return None
    bps = le16(raw, 11)
    spc = raw[13]
    reserved = le16(raw, 14)
    fats = raw[16]
    root_entries = le16(raw, 17)
    total16 = le16(raw, 19)
    media = raw[21]
    spf = le16(raw, 22)
    spt = le16(raw, 24)
    heads = le16(raw, 26)
    hidden = le32(raw, 28) if len(raw) >= 32 else 0
    total32 = le32(raw, 32) if len(raw) >= 36 else 0
    total = total16 or total32
    if bps not in (128, 256, 512, 1024, 2048, 4096):
        return None
    if spc == 0 or reserved == 0 or fats == 0 or spf == 0 or root_entries == 0 or total == 0:
        return None
    if total * bps > len(raw) + bps * 4:  # allow small mismatch only
        return None
    return BPB(bps, spc, reserved, fats, root_entries, total, media, spf, spt, heads, hidden)


def fat12_get(fat: bytes, cluster: int) -> int:
    off = cluster + cluster // 2
    if off + 1 >= len(fat):
        return 0xFFF
    val = fat[off] | (fat[off + 1] << 8)
    if cluster & 1:
        return (val >> 4) & 0xFFF
    return val & 0xFFF


def parse_dir_entry(entry: bytes) -> Optional[dict]:
    first = entry[0]
    if first == 0x00:
        return {'end': True}
    if first == 0xE5:
        deleted = True
    else:
        deleted = False
    attr = entry[11]
    if attr == 0x0F:  # VFAT LFN, not expected on Human68k
        return None
    name_raw = entry[0:8]
    ext_raw = entry[8:11]
    if name_raw[0] in (0x00,):
        return None
    name = decode_sjis(name_raw).rstrip()
    ext = decode_sjis(ext_raw).rstrip()
    if deleted:
        name = '_' + name[1:] if len(name) > 1 else '_DELETED'
    if ext:
        filename = f'{name}.{ext}'
    else:
        filename = name
    filename = safe_name(filename)
    start_cluster = le16(entry, 26)
    size = le32(entry, 28)
    return {
        'end': False,
        'deleted': deleted,
        'name': filename,
        'attr': attr,
        'start_cluster': start_cluster,
        'size': size,
        'raw_name_hex': entry[0:11].hex(),
    }


def extract_fat12(raw: bytes, outdir: Path) -> dict:
    bpb = parse_bpb(raw)
    if not bpb:
        return {'ok': False, 'reason': 'No plausible DOS/Human68k BPB found at offset 0'}

    outdir.mkdir(parents=True, exist_ok=True)
    bps = bpb.bytes_per_sector
    fat_off = bpb.reserved_sectors * bps
    fat = raw[fat_off:fat_off + bpb.sectors_per_fat * bps]
    root_off = bpb.first_root_sector * bps
    root_len = bpb.root_dir_sectors * bps
    root = raw[root_off:root_off + root_len]

    manifest = {
        'ok': True,
        'bpb': asdict(bpb),
        'files': [],
        'warnings': [],
    }

    def cluster_to_off(cluster: int) -> int:
        return (bpb.first_data_sector + (cluster - 2) * bpb.sectors_per_cluster) * bps

    def read_cluster_chain(start: int, max_bytes: int) -> Tuple[bytes, List[int]]:
        if start < 2:
            return b'', []
        seen = set()
        chain = []
        data = bytearray()
        cluster = start
        cluster_size = bpb.sectors_per_cluster * bps
        while 2 <= cluster < 0xFF8 and cluster not in seen:
            seen.add(cluster)
            chain.append(cluster)
            off = cluster_to_off(cluster)
            if off < 0 or off >= len(raw):
                break
            data += raw[off:off + cluster_size]
            if max_bytes and len(data) >= max_bytes:
                break
            nxt = fat12_get(fat, cluster)
            if nxt >= 0xFF8:
                break
            if nxt == 0xFF7:
                manifest['warnings'].append(f'Bad cluster in chain starting {start}: {cluster}')
                break
            if nxt == 0:
                break
            cluster = nxt
        return bytes(data[:max_bytes] if max_bytes else data), chain

    def walk_dir(dir_bytes: bytes, rel: Path):
        for i in range(0, len(dir_bytes), 32):
            ent = dir_bytes[i:i + 32]
            if len(ent) < 32:
                break
            parsed = parse_dir_entry(ent)
            if not parsed:
                continue
            if parsed.get('end'):
                break
            name = parsed['name']
            attr = parsed['attr']
            if name in ('.', '..'):
                continue
            if attr & 0x08:  # volume label
                manifest['volume_label'] = name
                continue
            target_rel = rel / name
            if attr & 0x10:  # directory
                data, chain = read_cluster_chain(parsed['start_cluster'], 0)
                if data:
                    (outdir / target_rel).mkdir(parents=True, exist_ok=True)
                    walk_dir(data, target_rel)
                continue
            data, chain = read_cluster_chain(parsed['start_cluster'], parsed['size'])
            target = outdir / target_rel
            target.parent.mkdir(parents=True, exist_ok=True)
            if target.exists():
                stem, suffix = target.stem, target.suffix
                target = target.with_name(f'{stem}_{i:04x}{suffix}')
            target.write_bytes(data)
            manifest['files'].append({
                'path': str(target_rel).replace('\\', '/'),
                'size': parsed['size'],
                'extracted_size': len(data),
                'attr': attr,
                'deleted': parsed['deleted'],
                'start_cluster': parsed['start_cluster'],
                'cluster_chain': chain,
                'sha256': sha256_hex(data),
                'raw_name_hex': parsed['raw_name_hex'],
            })

    walk_dir(root, Path('.'))
    return manifest


def dump_disk(disk: D88Disk, outdir: Path, args) -> None:
    disk_dir = outdir / f'disk{disk.index:02d}_{safe_name(disk.name, "noname")}'
    disk_dir.mkdir(parents=True, exist_ok=True)

    summary = disk.summary()
    (disk_dir / 'd88_summary.json').write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding='utf-8')
    (disk_dir / 'sectors_manifest.json').write_text(
        json.dumps([s.summary() for s in disk.sectors], ensure_ascii=False, indent=2), encoding='utf-8'
    )

    raw = reconstruct_raw(disk)
    if raw:
        ipl_len = min(args.ipl_bytes, len(raw))
        (disk_dir / f'ipl_first_{ipl_len}_bytes.bin').write_bytes(raw[:ipl_len])
        (disk_dir / 'ipl_first_sector.bin').write_bytes(raw[:min(len(raw), disk.sectors[0].actual_size if disk.sectors else 1024)])
        (disk_dir / 'ipl_sha256.txt').write_text(sha256_hex(raw[:ipl_len]) + '\n', encoding='ascii')

    if args.raw and raw:
        (disk_dir / 'reconstructed_raw.img').write_bytes(raw)

    if args.dump_sectors:
        sec_dir = disk_dir / 'sectors'
        sec_dir.mkdir(exist_ok=True)
        for s in disk.sectors:
            fname = f'C{s.c:02d}_H{s.h}_R{s.r:02d}_N{s.n}_off{s.file_offset:08x}_st{s.status:02x}.bin'
            (sec_dir / fname).write_bytes(s.data)

    if args.extract_files and raw:
        files_dir = disk_dir / 'files'
        manifest = extract_fat12(raw, files_dir)
        (disk_dir / 'fat_extract_manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding='utf-8')


def main() -> int:
    ap = argparse.ArgumentParser(description='D88/X68000 sector dumper and Human68k/FAT12 file extractor')
    ap.add_argument('images', nargs='+', help='D88 image(s), including concatenated multi-disk D88 files')
    ap.add_argument('-o', '--out', default='d88_extract_out', help='output directory')
    ap.add_argument('--info', action='store_true', help='print disk summaries')
    ap.add_argument('--raw', action='store_true', help='write reconstructed raw image')
    ap.add_argument('--dump-sectors', action='store_true', help='dump every sector as a separate file')
    ap.add_argument('--extract-files', action='store_true', help='try to extract Human68k/FAT12 files')
    ap.add_argument('--ipl-bytes', type=int, default=8192, help='number of initial raw bytes to dump/hash as IPL area')
    args = ap.parse_args()

    outroot = Path(args.out)
    outroot.mkdir(parents=True, exist_ok=True)

    for img in args.images:
        path = Path(img)
        if not path.exists():
            print(f'[-] missing: {path}')
            continue
        disks = parse_d88_file(path)
        if not disks:
            print(f'[-] no D88 disks parsed: {path}')
            continue
        image_out = outroot / safe_name(path.stem)
        image_out.mkdir(parents=True, exist_ok=True)
        print(f'[+] {path}: {len(disks)} disk(s)')
        for d in disks:
            if args.info:
                print(json.dumps(d.summary(), ensure_ascii=False, indent=2))
            dump_disk(d, image_out, args)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
