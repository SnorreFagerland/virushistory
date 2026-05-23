#!/usr/bin/env python3

import argparse
import csv
import hashlib
import json
import struct
import urllib.request
from pathlib import Path


DEFAULT_HASH_URL = "https://raw.githubusercontent.com/SnorreFagerland/virushistory/refs/heads/main/docs/mac_hashes.txt"


def u16(b, o): return struct.unpack_from(">H", b, o)[0]
def i16(b, o): return struct.unpack_from(">h", b, o)[0]
def u32(b, o): return struct.unpack_from(">I", b, o)[0]


def macroman(bs):
    return bs.decode("mac_roman", errors="replace")


def fourcc(bs):
    return bs.decode("mac_roman", errors="replace")


def hash_blob(b):
    return {
        "sha256": hashlib.sha256(b).hexdigest(),
        "md5": hashlib.md5(b).hexdigest(),
    }


def load_virus_hash_sets(url):
    with urllib.request.urlopen(url, timeout=20) as r:
        text = r.read().decode("utf-8-sig", errors="replace")

    groups = []
    current = []

    for raw_line in text.splitlines():
        line = raw_line.strip()

        if not line:
            continue

        if line == "-":
            if current:
                groups.append(current)
                current = []
            continue

        row = next(csv.reader([line]))

        if len(row) < 3:
            continue

        virus_name = row[0].strip()
        section_type = row[1].strip()
        sha256 = row[2].strip().lower()

        # Skip header rows or malformed rows
        if (
            virus_name.lower() == "virus name"
            or section_type.lower() == "section type"
            or sha256.lower() == "sha256"
        ):
            continue

        # Only accept real SHA-256 hashes
        if len(sha256) != 64 or any(c not in "0123456789abcdef" for c in sha256):
            continue

        current.append({
            "virus_name": virus_name,
            "section_type": section_type,
            "sha256": sha256,
        })

    if current:
        groups.append(current)

    return groups


def parse_resource_fork(data):
    if len(data) < 16:
        raise ValueError("Too small to be a resource fork")

    data_off = u32(data, 0)
    map_off = u32(data, 4)
    data_len = u32(data, 8)
    map_len = u32(data, 12)

    if data_off + data_len > len(data):
        raise ValueError("Resource data area extends past end of file")
    if map_off + map_len > len(data):
        raise ValueError("Resource map extends past end of file")

    map_attr = u16(data, map_off + 0x16)
    type_list_off = map_off + u16(data, map_off + 0x18)
    name_list_off = map_off + u16(data, map_off + 0x1A)

    type_count = u16(data, type_list_off) + 1
    type_entries_off = type_list_off + 2

    result = {
        "header": {
            "data_offset": data_off,
            "map_offset": map_off,
            "data_length": data_len,
            "map_length": map_len,
            "map_attributes": map_attr,
            "type_count": type_count,
        },
        "resources": [],
    }

    for t in range(type_count):
        te = type_entries_off + t * 8

        rtype = fourcc(data[te:te + 4])
        count = u16(data, te + 4) + 1
        ref_list_off = type_list_off + u16(data, te + 6)

        for r in range(count):
            re = ref_list_off + r * 12

            rid = i16(data, re)
            name_off_raw = u16(data, re + 2)
            attrs = data[re + 4]

            body_rel_off = (
                (data[re + 5] << 16) |
                (data[re + 6] << 8) |
                data[re + 7]
            )

            handle = u32(data, re + 8)

            body_len_off = data_off + body_rel_off
            body_len = u32(data, body_len_off)
            body_off = body_len_off + 4
            body_end = body_off + body_len

            if body_end > len(data):
                status = "truncated_or_invalid"
                body_len = max(0, len(data) - body_off)
                body_end = len(data)
            else:
                status = "ok"

            body = data[body_off:body_end]
            hashes = hash_blob(body)

            if name_off_raw == 0xFFFF:
                name = None
            else:
                no = name_list_off + name_off_raw
                nlen = data[no]
                name = macroman(data[no + 1:no + 1 + nlen])

            result["resources"].append({
                "type": rtype,
                "id": rid,
                "name": name,
                "attributes": attrs,
                "data_offset": body_off,
                "data_length": body_len,
                "data_end": body_end,
                "handle": handle,
                "status": status,
                "hashes": hashes,
            })

    return result


def identify_virus_matches(parsed, hash_sets):
    resource_hashes = set(
        r["hashes"]["sha256"].lower()
        for r in parsed["resources"]
    )

    identified = []
    possible = []

    for group in hash_sets:
        virus_names = sorted(set(x["virus_name"] for x in group))
        virus_name = virus_names[0] if len(virus_names) == 1 else " / ".join(virus_names)

        wanted = set(
            x["sha256"].lower()
            for x in group
        )

        matched = wanted & resource_hashes

        wanted_count = len(wanted)
        matched_count = len(matched)

        item = {
            "virus_name": virus_name,
            "matched": matched_count,
            "total": wanted_count,
            "matched_sections": [
                {
                    "section_type": x["section_type"],
                    "sha256": x["sha256"].lower()
                }
                for x in group
                if x["sha256"].lower() in matched
            ],
        }

        if matched_count == wanted_count:
            identified.append(item)
        elif matched_count > 0:
            possible.append(item)

    return identified, possible


def safe_name(s):
    bad = '<>:"/\\|?*\x00'
    return "".join("_" if c in bad else c for c in str(s))


def dump_resources(data, parsed, outdir):
    Path(outdir).mkdir(parents=True, exist_ok=True)

    for res in parsed["resources"]:
        body = data[res["data_offset"]:res["data_end"]]

        namepart = f"_{safe_name(res['name'])}" if res["name"] else ""
        fname = f"{safe_name(res['type'])}_{res['id']}{namepart}.bin"
        path = Path(outdir) / fname

        with open(path, "wb") as f:
            f.write(body)

        res["dumped_to"] = str(path)


def print_text(parsed):
    h = parsed["header"]

    print("Resource fork")
    print("=" * 60)
    print(f"Data offset : 0x{h['data_offset']:08X}")
    print(f"Map offset  : 0x{h['map_offset']:08X}")
    print(f"Data length : 0x{h['data_length']:08X} / {h['data_length']}")
    print(f"Map length  : 0x{h['map_length']:08X} / {h['map_length']}")
    print(f"Map attrs   : 0x{h['map_attributes']:04X}")
    print(f"Types       : {h['type_count']}")
    print()

    headers = [
        "TYPE", "ID", "ATTR", "OFFSET", "SIZE",
        "NAME", "MD5", "SHA256", "STATUS"
    ]

    rows = []

    for r in parsed["resources"]:
        rows.append([
            r["type"],
            str(r["id"]),
            f"0x{r['attributes']:02X}",
            f"0x{r['data_offset']:08X}",
            str(r["data_length"]),
            r["name"] or "",
            r["hashes"]["md5"],
            r["hashes"]["sha256"],
            r["status"],
        ])

    widths = [
        max(len(headers[i]), *(len(row[i]) for row in rows))
        for i in range(len(headers))
    ]

    fmt = "  ".join(f"{{:<{w}}}" for w in widths)

    print(fmt.format(*headers))
    print(fmt.format(*["-" * w for w in widths]))

    for row in sorted(rows, key=lambda x: (x[0], int(x[1]))):
        print(fmt.format(*row))


def print_virus_matches(identified, possible):
    print()
    print("Virus hash check")
    print("=" * 60)

    if not identified and not possible:
        print("No matches")
        return

    for m in identified:
        print(f"Identified as {m['virus_name']}")

    if not identified:
        for m in possible:
            print(
                f"Possible variant of {m['virus_name']} "
                f"({m['matched']}/{m['total']} section hashes matched)"
            )


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("file", help="classic Mac resource fork file")
    ap.add_argument("--dump", metavar="DIR", help="dump each resource body to DIR")
    ap.add_argument("--json", action="store_true", help="emit JSON instead of text")
    ap.add_argument("--hash-url", default=DEFAULT_HASH_URL, help="virus hash CSV URL")
    ap.add_argument("--no-virus-check", action="store_true", help="skip online virus hash check")
    args = ap.parse_args()

    with open(args.file, "rb") as f:
        data = f.read()

    parsed = parse_resource_fork(data)

    if args.dump:
        dump_resources(data, parsed, args.dump)

    identified = []
    possible = []

    if not args.no_virus_check:
        hash_sets = load_virus_hash_sets(args.hash_url)
        identified, possible = identify_virus_matches(parsed, hash_sets)

    if args.json:
        parsed["virus_matches"] = {
            "identified": identified,
            "possible": possible,
        }
        print(json.dumps(parsed, indent=2, ensure_ascii=False))
    else:
        print_text(parsed)

        if not args.no_virus_check:
            print_virus_matches(identified, possible)


if __name__ == "__main__":
    main()


