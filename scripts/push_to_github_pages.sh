#!/bin/bash

cd ${REPO_FOLDER}
git add .
git commit -a -m "${{ env.CI_COMMIT_MESSAGE }}  Automated commit generated from Gihub acions     in cocoon repo"
git push
