#!/usr/bin/env bash

rm -rf ./site/
mkdir -p ./site/posts

./build.sh

git subtree push --prefix site origin gh-pages