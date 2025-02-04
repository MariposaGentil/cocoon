#!/usr/bin/env bash


drafts=false
py_draft_arg=""
site_path="./site"  # TODO Move to arg
mkdir -p $site_path
subsite_forder="/"
settings="$(./scripts/load_yaml_settings.sh)"


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

if [ $branch ]
then
	if [ $branch != "master" ]
	then
		subsite_folder="/subsites/$branch"
	fi
fi


# Generate index.md

python3 ./scripts/generate_index.py ${py_draft_arg} > ./root/index.md

root_md_files=$(find ./root -maxdepth 1 -type f -name "*.md")

# Copy assets

cp -r ./assets $site_path/assets

# Copy CNAME, favicon, css to$site_path/

for root_non_md_file in $root_non_md_files
do
	cp ${root_non_md_file} $site_path/$(basename ${root_non_md_file})
done


# Compile root markdown files (index)
for root_file in $root_md_files
do
    out_path="$site_path/$(basename ${root_file} .md).html" 
	echo $settings |\
	xargs pandoc \
		--template=./templates/index.html5 \
		--standalone \
		--metadata pagetitle="Cocoon" \
		--css=$subsite_folder/assets/css/styling.max.css \
		-H ./assets/js/cocoon.js.html \
		-H ./assets/html/root_header.html5 \
		-V lang=en \
		-V highlighting-css= \
		--mathjax \
		--to=html5 ${root_file} \
		-o "$out_path"_decryp

    # Encrypt file
    openssl enc -aes-256-cbc -salt -in "$out_path"_decryp -out $out_path -pass pass:123
    rm "$out_path"_decryp
    # https://github.com/mdn/dom-examples/blob/main/web-crypto/encrypt-decrypt/aes-cbc.js\
    # https://developer.mozilla.org/en-US/docs/Web/API/SubtleCrypto/decrypt

done

