import os
import argparse

parser = argparse.ArgumentParser(description="Parse pandoc markdown for front matter")
parser.add_argument('--drafts', dest='include_drafts', action="store_true", help='include drafts in build')


def parse_filename_details(include_drafts):
    files = {}

    filenames = []
    for root, dirs, post_files in os.walk("./posts"):
        for f in post_files:
            filenames.append("./posts/" + f)

    if include_drafts:
        for root, dirs, draft_files in os.walk("./drafts"):
            for f in draft_files:
                filenames.append("./drafts/" + f)


    for filename in filenames:
        details = {}
        with open(filename, 'r') as f:
            details['uri'] = os.path.splitext(filename)[0].replace("./", '') + ".html"
            for i, line in enumerate(f):
                if i == 0 and line.startswith('%'):
                    details["title"] = line.replace("% ", '').strip()
                elif i == 2 and line.startswith('%'):
                    details["date"] = line.replace("% ", '').strip()
                elif i == 3 and line.startswith('%'):
                    details["image"] = line.replace("% ", '').strip()
        files[filename] = details
    return files



def gen_index_page(files):
    md_text = gen_header_md()
    sorted_filenames = sorted(files, key=lambda f: files[f]["date"], reverse=True)
    all_post_entries = map(gen_md, [files[f] for f in sorted_filenames])
    md_text += "\n\n".join(all_post_entries)
    return md_text


def gen_header_md():
    with open("./templates/header.md", 'r') as f:
        return f.read()


def gen_md(file_details: dict):
    return "[**{title}**]({link}) \  <small>{date}</small>".format(title=file_details["title"], link=file_details["uri"], date=file_details["date"])  


if __name__ == "__main__":
    args = parser.parse_args()
    files = parse_filename_details(args.include_drafts)
    result = gen_index_page(files)
    print(result)

