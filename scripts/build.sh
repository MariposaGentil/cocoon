#!/usr/bin/env bash


drafts=false
py_draft_arg=""
site_path="./site"  # TODO Move to arg


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
	rm -rf $site_path/drafts/
	mkdir -p $site_path/drafts
	draft_files=$(find ./drafts -maxdepth 1 -type f -name "*.md")

    # Compile draft files and save to$site_path/drafts/
	for draft_file in $draft_files
	do
		pandoc \
			--template=./templates/post.html5 \
			--title-prefix="Cocoon" --css=/assets/css/styling.max.css \
			-H ./assets/js/cocoon.js.html \
			-V lang=en \
			-V highlighting-css= \
			--mathjax \
			--to=html5 ${draft_file} \
			-o $site_path/drafts/$(basename ${draft_file} .md).html
	done
else
	rm -rf $site_path/drafts
fi


# Generate index.md

python3 ./scripts/generate_index.py ${py_draft_arg} > ./root/index.md

root_non_md_files=$(find ./root -maxdepth 1 -type f -not -name "*.md")
root_md_files=$(find ./root -maxdepth 1 -type f -name "*.md")
post_files=$(find ./posts -maxdepth 1 -type f -name "*.md")


# Copy assets

cp -r ./assets $site_path/


# Copy CNAME, favicon, css to$site_path/

for root_non_md_file in $root_non_md_files
do
	cp ${root_non_md_file} $site_path/$(basename ${root_non_md_file})
done


# Compile root markdown files (index, about)

for root_file in $root_md_files
do
	pandoc \
		--template=./templates/index.html5 \
		--standalone \
		--metadata pagetitle="Cocoon" \
		--css=/assets/css/styling.max.css \
		-H ./assets/js/cocoon.js.html \
		-H ./assets/html/root_header.html5 \
		-V lang=en \
		-V highlighting-css= \
		--mathjax \
		--to=html5 ${root_file} \
		-o $site_path/$(basename ${root_file} .md).html
done

mkdir -p $site_path/posts


# Compile posts

for post_file in $post_files
do
	pandoc \
		--template=./templates/post.html5 \
		--title-prefix="Cocoon" --css=/assets/css/styling.max.css \
		-H ./assets/js/cocoon.js.html \
		-V lang=en \
		-V highlighting-css= \
		--mathjax \
		--to=html5 ${post_file} \
		-o $site_path/posts/$(basename ${post_file} .md).html
done
