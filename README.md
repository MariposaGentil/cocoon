# Blog

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

