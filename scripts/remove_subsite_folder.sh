#!/bin/bash

export branch=$(sed 's/refs-heads-/''/' <<< ${branch//'/'/-})
export folder="subsites/${branch}"
echo "Remove subsite ${folder}"
rm -rf ${REPO_FOLDER}/${folder}

