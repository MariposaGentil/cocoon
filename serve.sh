#!/usr/bin/env bash

build_cmd=./build.sh

if [ -n "${1}" ]
then
    if [ "${1}" = "--drafts" ]
    then
        build_cmd="./build.sh --drafts"
    fi
fi


watch -n 1 ${build_cmd} &
(cd ./site ; python3 -m http.server)
echo Done
