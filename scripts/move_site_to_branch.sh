#!/bin/bash

if [ "${branch}" = 'master' ]
then
	export dst_folder=''
else
	export dst_folder="subsites/${branch}"
fi
echo "Copiying site to ${REPO_FOLDER}/${dst_folder}"
mkdir  -p ${REPO_FOLDER}/${dst_folder}
cp -rv ${OUTPUT_SITE_FOLDER}/* ${REPO_FOLDER}/${dst_folder}
ls ${REPO_FOLDER}/${dst_folder}
