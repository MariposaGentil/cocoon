#!/bin/bash

read -a split_branch <<< ${branch//'/'/' '}
if [ "${split_branch[-1]}" = 'master' ]
then
	echo 'master'
else
	echo ${split_branch[-1]}
fi
