#!/usr/bin/env bash


drafts=false
py_draft_arg=""


# Parse args

if [ -n ${1} ]
then
    # Check for --drafts
	if [ "${1}" = "--drafts" ]
	then
		drafts=true
		py_draft_arg=${1}
	fi
fi


# Drafts

if [ ${drafts} = true ]
then
    # Clean drafts dir
	rm -rf ./site/drafts/
	mkdir -p ./site/drafts
	draft_files=$(find ./drafts -maxdepth 1 -type f -name "*.md")

    # Compile draft files and save to .site/drafts/
	for draft_file in $draft_files
	do
		pandoc \
			--template=./templates/custom-post-template.html5 \
			--title-prefix="Cocoon" --css=/assets/css/styling.max.css \
			-H ./assets/js/cocoon.js.html \
			-V lang=en \
			-V highlighting-css= \
			--mathjax \
			--to=html5 ${draft_file} \
			-o ./site/drafts/$(basename ${draft_file} .md).html
	done
else
	rm -rf ./site/drafts
fi


# Generate index.md

python3 ./generate_index.py ${py_draft_arg} > ./root/index.md

root_non_md_files=$(find ./root -maxdepth 1 -type f -not -name "*.md")
root_md_files=$(find ./root -maxdepth 1 -type f -name "*.md")
post_files=$(find ./posts -maxdepth 1 -type f -name "*.md")


# Copy assets

cp -r ./assets ./site/


# Copy CNAME, favicon, css to .site/

for root_non_md_file in $root_non_md_files
do
	cp ${root_non_md_file} ./site/$(basename ${root_non_md_file})
done


# Compile root markdown files (index, about)

for root_file in $root_md_files
do
	pandoc \
		--standalone \
		--metadata pagetitle="Cocoon" \
		--css=/assets/css/styling.max.css \
		-H ./assets/js/cocoon.js.html \
		-H ./assets/html/root_header.html5 \
		-V lang=en \
		-V highlighting-css= \
		--mathjax \
		--to=html5 ${root_file} \
		-o ./site/$(basename ${root_file} .md).html
done

mkdir -p ./site/posts


# Compile posts

for post_file in $post_files
do
	pandoc \
		--template=./templates/custom-post-template.html5 \
		--title-prefix="Cocoon" --css=/assets/css/styling.max.css \
		-H ./assets/js/cocoon.js.html \
		-V lang=en \
		-V highlighting-css= \
		--mathjax \
		--to=html5 ${post_file} \
		-o ./site/posts/$(basename ${post_file} .md).html
done
