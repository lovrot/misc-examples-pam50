#!/bin/bash

## Inspiration
## http://stackoverflow.com/questions/7933044/commit-a-file-to-a-different-branch-without-checkout

cd /tmp/
git clone ~/git/misc-examples-pam50

cd /tmp/misc-examples-pam50/
git checkout gh-pages

cp ~/git/misc-examples-pam50/reports/example-pam50-in-mainz-html-version.html ./index.html

git add index.html
git commit -m "Update gh-page"
git push origin gh-pages

cd ..
rm -fR misc-examples-pam50

cd ~/git/misc-examples-pam50
