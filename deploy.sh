#!/usr/bin/env bash

set -e
set -x

rm -rf public
hugo
mv docs/CNAME .
rm -rf docs
mv public docs
mv CNAME docs/

git add -A
git commit -m "Update site"
git push
