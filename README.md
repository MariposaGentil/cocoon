[![build-site](https://github.com/MariposaGentil/cocoon/actions/workflows/build-site.yml/badge.svg?branch=master)](https://github.com/MariposaGentil/cocoon/actions/workflows/build-site.yml)

# Cocoon content
This repo hosts the content for https://mariposagentil.github.io/ each time a new commit is created to either: master, develop or preview/**; the contents are rendered and commited to the blog

## Install

1. `git clone https://github.com/MariposaGentil/cocoon && cd cocoon` this repo
1. `./scripts/install_requirements.sh`

## Write/Preview

1. Add content to `./posts`
1. Add front matter at the beginning of each post:
    ```
    % Title
    % Author (optional, keep '%' even if empty)
    % Date (YYYY-MM-DD format)
    ```
1. `make smart_serve`
    - To also serve drafts in `./drafts`, use `--drafts`

## Makefile
Checkout `Makefile` to get a list of the usual tasks

## Deploy
1. Write a new commit
1. Push changes
    1. This will build and post your changes in the configured HOST
1. Go to the configured HOST

