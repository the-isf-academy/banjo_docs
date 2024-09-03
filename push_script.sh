#!/bin/sh
#if [ -z "$1" ]
#then
#  echo "Which folder do you want to deploy to GitHub Pages?"
#  exit 1
#fi
#git subtree push --prefix $1 origin gh_pages
git subtree push --prefix docs/_build/html origin gh_pages
