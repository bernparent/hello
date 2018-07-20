#!/bin/sh

command -v git >/dev/null 2>&1 || { echo "gitnewversion requires git but it is not installed.  Aborting." >&2; exit 1; }

filecheck="README"
if [ -f "$filecheck" ]; then
 if [ $# -eq 1 ]; then
  if git show-ref --tags $1 ; then
    echo Version $1 already committed
    exit 
  fi
  if git ls-remote --exit-code --tags origin $1 ; then
    echo Version $1 already committed on github
    exit 
  fi
  echo 'copy to origin (github) using git..'
  git add -A .
  git commit -a -m "$1" 
  git tag -d $1 > /dev/null 2>&1
  git tag -a $1 -m "$1"
  git push --tags origin master
  echo '[done]'
 else
  echo "gitnewversion.sh needs one argument: the new version string"
 fi
else
 echo "gitnewversion.sh must be run from the main directory."
fi


