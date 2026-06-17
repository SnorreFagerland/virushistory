import hashlib
import sys
import requests

HASHLIST_URL = "https://raw.githubusercontent.com/SnorreFagerland/virushistory/refs/heads/main/docs/hashlist.csv"


def sha256_file(filepath):
    h = hashlib.sha256()
    with open(filepath, "rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            h.update(chunk)
    return h.hexdigest()


def fetch_hashlist():
    resp = requests.get(HASHLIST_URL, timeout=10)
    resp.raise_for_status()
    return resp.text.splitlines()


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <file>")
        sys.exit(1)

    filepath = sys.argv[1]

    try:
        file_hash = sha256_file(filepath)
    except Exception as e:
        print(f"[!] Failed to read file: {e}")
        sys.exit(1)

    print(f"[+] SHA256: {file_hash}")

    try:
        hashlist = fetch_hashlist()
    except Exception as e:
        print(f"[!] Failed to fetch hash list: {e}")
        sys.exit(1)

    # Simple containment check (assumes hash appears somewhere in each line)
    found = any(file_hash.lower() in line.lower() for line in hashlist)

    if found:
        print("[!] Hash FOUND in list")
    else:
        print("[+] Hash NOT found")


if __name__ == "__main__":
    main()

