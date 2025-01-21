import os
import re

def extract_malware_name(folder_path):
    """Extracts the malware name from the folder path following the given structure."""
    parts = folder_path.split(os.sep)
    
    # Ignore base directory and ensure at least one meaningful subfolder
    if len(parts) < 2:
        return None, None
    
    # Filter valid name components
    valid_parts = []
    size_value = None
    
    for part in parts:
        # Check if part is a size (numeric)
        if re.match(r'^\d+$', part):
            size_value = part  # Store size

        valid_parts.append(str(part).capitalize())  # Store other components
    
    malware_name = ".".join(valid_parts)
    return malware_name, size_value



def update_readme(readme_path, malware_name, size_value):
    """Updates the readme.md file with the extracted malware name and size."""
    try:
        with open(readme_path, 'r', encoding='utf-8') as file:
            content = file.readlines()
            if content[0].find("<h3>Malware name	: - </h3><br>") > -1:
                for i in range(len(content)):
                    if "Malware name" in content[i]:
                        content[i] = f"<h3>Malware name	: {malware_name} </h3><br>\n"
                    elif "| **Size** |" in content[i]:
                        content[i] = f"| **Size** | {size_value} bytes |\n"
        
                # Write back the updated content
                with open(readme_path, 'w', encoding='utf-8') as file:
                    file.writelines(content)
        
                print(f"Updated: {readme_path}")
    except Exception as e:
        print(f"Error updating {readme_path}: {e}")



def process_folders(base_path):
    """Traverses directories and updates readme.md files."""
    for root, dirs, files in os.walk(base_path):
        if 'readme.md' in files:
            malware_name, size_value = extract_malware_name(os.path.relpath(root, base_path))
            if malware_name:
                update_readme(os.path.join(root, 'readme.md'), malware_name, size_value)

if __name__ == "__main__":
    base_directory = "."  # Adjust if needed
    process_folders(base_directory)

