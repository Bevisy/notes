#!/bin/bash

set -x
echo "TRAVIS_BRANCH=${TRAVIS_BRANCH}"
if [[ "${TRAVIS_BRANCH}" != "master" ]]; then
    echo "give up updating TOC @ branch ${TRAVIS_BRANCH}"
    exit 0
fi

git config --global user.email "ytinirt@qq.com"
git config --global user.name "ZHAO Yao"

./tool/gh-md-toc --insert ./README.md

git add ./README.md
git commit --message "Travis CI build: $TRAVIS_BUILD_NUMBER"

git remote add origin-ci https://${GH_TRAVIS_CI_TOKEN}@github.com/ytinirt/notes.git
git push --set-upstream origin-ci master
