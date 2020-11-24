#!/bin/sh -ex

target_branch="br-web"
git config --global user.name "CircleCI deployer"
git config --global user.email "<>"
git checkout $target_branch

echo "$(python getDeployTime.py)" > foo.txt

git add foo.txt
git commit -m "[skip ci] updates GitHub Pages"
if [ $? -ne 0 ]; then
  echo "nothing to commit"
  exit 0
fi

git remote set-url origin "git@github.com:forestdan/myproj.git"
git push -f origin $target_branch