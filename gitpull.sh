#!/bin/sh
command -v git >/dev/null 2>&1 || { echo "gitpull requires git but it is not installed.  Aborting." >&2; exit 1; }

filecheck="README"
if [ -f "$filecheck" ]; then
  git pull --tags origin master
else
 echo "gitpull must be run from the main directory."
fi

