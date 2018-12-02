# Blog

## Install

1. `sudo apt install pandoc markdown`
1. `git clone` this repo
1. `mkdir -p ./site/posts`

## Write/Test

1. `cd ./site && python3 -m http.server`
1. Open new terminal window in `./`
1. `watch -n 1 ./build.sh`

## Deploy

1. `git add ... ; git commit -m ... ; git push -u origin master`
1. `./deploy.sh`