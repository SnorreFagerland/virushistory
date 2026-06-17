#!/usr/bin/env python3

import csv
import hashlib
import sys
from pathlib import Path

import requests

HASHLIST_URL = "https://raw.githubusercontent.com/SnorreFagerland/virushistory/refs/heads/main/docs/hashlist.csv"


def sha256_file(filepath: Path) -> str:
    h = hashlib.sha256()
    with filepath.open("rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            h.update(chunk)
    return h.hexdigest()


def fetch_hashes() -> set[str]:
    resp = requests.get(HASHLIST_URL, timeout=20)
    resp.raise_for_status()

    hashes = set()

    for row in csv.reader(resp.text.splitlines()):
        for field in row:
            field = field.strip().lower()
            if len(field) == 64 and all(c in "0123456789abcdef" for c in field):
                hashes.add(field)

    return hashes


def enumerate_files(folder: Path):
    for path in folder.iterdir():
        if path.is_file():
            yield path


def main():
    delete = "--delete" in sys.argv

    folder = Path.cwd()

    print(f"[+] Fetching hash list...")
    try:
        known_hashes = fetch_hashes()
    except Exception as e:
        print(f"[!] Failed to fetch hash list: {e}")
        sys.exit(1)

    print(f"[+] Loaded {len(known_hashes):,} hashes into memory")
    print(f"[+] Scanning current folder: {folder}")

    matches = 0
    errors = 0

    for path in enumerate_files(folder):
        try:
            file_hash = sha256_file(path)
        except Exception as e:
            errors += 1
            print(f"[!] Could not hash {path.name}: {e}")
            continue

        if file_hash.lower() in known_hashes:
            matches += 1
            print(f"[MATCH] {path.name}  {file_hash}")

            if delete:
                try:
                    path.unlink()
                    print(f"        deleted")
                except Exception as e:
                    errors += 1
                    print(f"        [!] delete failed: {e}")
            else:
                print(f"        dry-run only; use --delete to remove")

    print()
    print(f"[+] Done")
    print(f"    Matches: {matches}")
    print(f"    Errors:  {errors}")

    if not delete:
        print("[*] No files were deleted. Re-run with --delete to remove matches.")


if __name__ == "__main__":
    main()

