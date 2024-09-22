#!/bin/bash

commit_prefix="Content commit ${ENV_COMMIT_MSG}-${ENV_COMMIT_SHA}"
if [ $# -gt 0 ]
then
	if [ $1 = "--remove" ]
	then
	commit_prefix="${ENV_COMMIT_MSG} Removed subsite ${branch}"
	fi
fi
commit_msg="${commit_prefix} Automated commit generated from Gihub acions in remote repo"
echo ${commit_msg}
cd ${REPO_FOLDER}
git add .
git commit -a -m "${commit_msg}"
git push
