import os
import argparse

parser = argparse.ArgumentParser(description="Parse pandoc markdown for front matter")
parser.add_argument('-p', '--password', type=str, help='Expected input to encode contents')

def gen_index_page():
    md_text = gen_header_md()
    return md_text


def gen_header_md():
    return ''


if __name__ == "__main__":
    args = parser.parse_args()
    result = gen_index_page()
    print(result)

