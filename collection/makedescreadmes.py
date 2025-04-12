import os

TAG = "<!-- AUTO-GENERATED-README -->"
MAX_DEPTH = 2  # Current folder = level 0

def get_folder_tree(root, prefix="", current_depth=0):
    """Returns a markdown-formatted tree of subfolders and files up to MAX_DEPTH."""
    if current_depth > MAX_DEPTH:
        return []

    entries = sorted(os.listdir(root))
    entries = [e for e in entries if e.lower() != "readme.md"]
    
    tree_lines = []
    for idx, entry in enumerate(entries):
        full_path = os.path.join(root, entry)
        connector = "└── " if idx == len(entries) - 1 else "├── "
        tree_lines.append(f"{prefix}{connector}{entry}")

        if os.path.isdir(full_path):
            sub_prefix = "    " if idx == len(entries) - 1 else "│   "
            tree_lines.extend(get_folder_tree(full_path, prefix + sub_prefix, current_depth + 1))
    
    return tree_lines

def should_write_readme(readme_path):
    """Checks if the README.md file is absent or contains the auto-generated tag."""
    if not os.path.exists(readme_path):
        return True

    with open(readme_path, "r", encoding="utf-8") as f:
        first_line = f.readline().strip()
        return TAG in first_line

def process_directory_tree(base_dir):
    for current_dir, subdirs, files in os.walk(base_dir):
        depth_from_root = os.path.relpath(current_dir, base_dir).count(os.sep)
        if not subdirs or depth_from_root > MAX_DEPTH:
            continue

        readme_path = os.path.join(current_dir, "README.md")
        if not should_write_readme(readme_path):
            continue

        tree_md = get_folder_tree(current_dir, current_depth=0)
        content = f"{TAG}\n# Contents of `{os.path.basename(current_dir)}`\n\n"
        content += "```\n" + "\n".join(tree_md) + "\n```"

        with open(readme_path, "w", encoding="utf-8") as f:
            f.write(content)
        print(f"Updated README.md in: {current_dir}")

# Example usage:
if __name__ == "__main__":
    base_directory = "."
    process_directory_tree(base_directory)
