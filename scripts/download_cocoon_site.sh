#!/bin/bash

export email=$(git log -n 1 --pretty=format:%ae)
export name=$(git log -n 1 --pretty=format:%an)
rm -rf .git
git clone https://github.com/MariposaGentil/MariposaGentil.github.io ${REPO_FOLDER}
cd ${REPO_FOLDER}
git config --local user.email "$email"
git config --local user.name "$name"
