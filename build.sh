#!/usr/bin/env bash

# cp styling.css site/

# root_files="./CNAME
# ./favicon.ico
# ./styling.css"

root_non_md_files=$(find ./root -maxdepth 1 -type f -not -name "*.md")
root_md_files=$(find ./root -maxdepth 1 -type f -name "*.md")
post_files=$(find ./posts -maxdepth 1 -type f -name "*.md")

for root_file in $root_files
do
	cp ${root_file} ./site/${root_file}
done


for root_file in $root_md_files
do
	pandoc --css=/styling.css -V lang=en -V highlighting-css= --mathjax \
		--smart --to=html5 ${root_file} -o ./site/$(basename ${root_file} .md).html
	
done

for post_file in $post_files
do
	pandoc --template=./custom-post-template.html5 --title-prefix="Charcoalbin" --css=/styling.css -V lang=en -V highlighting-css= --mathjax \
		--smart --to=html5 ${post_file} -o ./site/posts/$(basename ${post_file} .md).html
done
