# Cocoon content
This repo hosts the content for https://mariposagentil.github.io/ each time a new commit is created to either: master, develop or preview/**; the contents are rendered and commited to the blog

# Building status
[![build-site](https://github.com/MariposaGentil/cocoon/actions/workflows/build-site.yml/badge.svg?branch=master)](https://github.com/MariposaGentil/cocoon/actions/workflows/build-site.yml)

## Install

1. `sudo apt install pandoc markdown`
1. `git clone` this repo

## Write/Preview

1. Add content to `./posts`
1. Add front matter at the beginning of each post:
    ```
    % Title
    % Author (optional, keep '%' even if empty)
    % Date (YYYY-MM-DD format)
    ```
1. `./serve.sh`
    - To also serve drafts in `./drafts`, use `--drafts`

## Deploy

1. Get all files situated:
    - `git add ... ; git commit -m ... ; git push -u origin master`
3. Build and push just `./site` files:
    - `./deploy.sh`

