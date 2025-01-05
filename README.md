[![build-site](https://github.com/MariposaGentil/cocoon/actions/workflows/build-site.yml/badge.svg?branch=master)](https://github.com/MariposaGentil/cocoon/actions/workflows/build-site.yml) [![Deploy](https://github.com/MariposaGentil/MariposaGentil.github.io/actions/workflows/static.yml/badge.svg)](https://github.com/MariposaGentil/MariposaGentil.github.io/actions/workflows/static.yml)

****

# Cocoon content
This repo hosts the content for https://mariposagentil.github.io/ each time a new commit is created to either: master, develop or preview/**; the contents are rendered and commited to the blog

## Install

1. `git clone https://github.com/MariposaGentil/cocoon && cd cocoon` this repo
1. `./scripts/install_requirements.sh`

## Create a new subsite

1. Checkout a new branch, called:
    - subsite/[subsite_name]
    - update /config/main.yml
    - Execute ```$ make clean | make build | make run```

## Makefile
Checkout `Makefile` to get a list of the usual tasks

## Deploy
1. Write a new commit
1. Push changes
    1. This will build and post your changes in the configured HOST
1. Go to the configured HOST

