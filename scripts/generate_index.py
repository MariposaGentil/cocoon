import os
import argparse

def gen_index_page():
    md_text = gen_header_md()
    return md_text

def gen_header_md():
    return ''

def gen_md(file_details: dict):
    return "[**{title}**]({link}) \n  <small>{date}</small>".format(title=file_details["title"], link=file_details["uri"], date=file_details["date"])  


if __name__ == "__main__":
    args = parser.parse_args()
    result = gen_index_page(files)
    print(result)

