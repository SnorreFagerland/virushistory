#!/usr/bin/env python3
import argparse
import hashlib
from pathlib import Path


def sha256_file(path, chunk_size=1024 * 1024):
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(chunk_size), b""):
            h.update(chunk)
    return h.hexdigest()


def main():
    ap = argparse.ArgumentParser(
        description="Delete duplicate files under the current folder, keeping the first copy found."
    )
    ap.add_argument("--apply", action="store_true",
                    help="Actually delete duplicates. Without this, only prints what would be deleted.")
    ap.add_argument("--root", default=".",
                    help="Root folder to scan. Default: current folder.")
    args = ap.parse_args()

    root = Path(args.root).resolve()
    seen = {}

    for path in sorted(root.rglob("*")):
        if not path.is_file():
            continue

        try:
            digest = sha256_file(path)
        except Exception as e:
            print(f"[!] Skipping unreadable file: {path} ({e})")
            continue

        if digest not in seen:
            seen[digest] = path
            print(f"[KEEP] {digest}  {path}")
            continue

        original = seen[digest]
        print(f"[DUP ] {digest}  {path}")
        print(f"      original: {original}")

        if args.apply:
            try:
                path.unlink()
                print(f"      deleted")
            except Exception as e:
                print(f"      [!] delete failed: {e}")

    if not args.apply:
        print("\nDry run only. Re-run with --apply to actually delete duplicates.")


if __name__ == "__main__":
    main()

