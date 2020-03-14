import os


HEADER = """[home](./)

# Art
"""


def parse_files():
    entries = []
    directory = os.path.join(os.getcwd(), "assets", "images", "art")
    for root, dirs, files in os.walk(directory):
        for file in files:
            md = "![](/assets/images/art/" + file + ")"
            entries.append({
                "time": os.path.getctime(os.path.join(directory, file)),
                "md": md
            })
    sorted_entries = sorted(entries, key=lambda x: x["time"], reverse=True)
    return sorted_entries


def write_md(entries):
    print(HEADER)
    print("\n\n".join([entry["md"] for entry in entries]))


if __name__ == "__main__":
    entries = parse_files()
    write_md(entries)