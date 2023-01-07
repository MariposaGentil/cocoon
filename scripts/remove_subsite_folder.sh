#!/bin/bash

export folder="subsites/${branch}"
echo "Remove subsite ${folder}"
rm -rf ${REPO_FOLDER}/${folder}

