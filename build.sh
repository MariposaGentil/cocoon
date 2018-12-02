#!/usr/bin/env bash

drafts=false
py_draft_arg=""


# Args
if [ -n ${1} ]
then
	if [ "${1}" = "--drafts" ]
	then
		drafts=true
		py_draft_arg=${1}
	fi
fi


# Drafts
if [ ${drafts} = true ]
then
	mkdir -p ./site/drafts
	draft_files=$(find ./drafts -maxdepth 1 -type f -name "*.md")

	for draft_file in $draft_files
	do
		pandoc --template=./templates/custom-post-template.html5 --title-prefix="Charcoalbin" --css=/styling.css -V lang=en -V highlighting-css= --mathjax \
			--smart --to=html5 ${draft_file} -o ./site/drafts/$(basename ${draft_file} .md).html
	done
else
	rm -rf ./site/drafts
fi


# Generate index.md
python3 ./generate_index.py ${py_draft_arg} > ./root/index.md

root_non_md_files=$(find ./root -maxdepth 1 -type f -not -name "*.md")
root_md_files=$(find ./root -maxdepth 1 -type f -name "*.md")
post_files=$(find ./posts -maxdepth 1 -type f -name "*.md")

for root_non_md_file in $root_non_md_files
do
	cp ${root_non_md_file} ./site/$(basename ${root_non_md_file})
done


for root_file in $root_md_files
do
	pandoc --css=/styling.css -V lang=en -V highlighting-css= --mathjax \
		--smart --to=html5 ${root_file} -o ./site/$(basename ${root_file} .md).html
done


for post_file in $post_files
do
	pandoc --template=./templates/custom-post-template.html5 --title-prefix="Charcoalbin" --css=/styling.css -V lang=en -V highlighting-css= --mathjax \
		--smart --to=html5 ${post_file} -o ./site/posts/$(basename ${post_file} .md).html
done
