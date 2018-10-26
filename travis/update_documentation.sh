#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"
REPO_SLUG="kArTeL/Natty"

function doCompile {
  bundle exec jazzy
}

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "${TRAVIS_EVENT_TYPE}" != "push" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" -o "$TRAVIS_REPO_SLUG" != "$REPO_SLUG" ]; then
    echo "Skipping deploy; just doing a build."
    exit 0
fi

# Run the documentation creation function in this case jazzy.
doCompile 

# Get the `gh-pages` branch and put inside a folder with the samwe name
echo "Cloning gh-pages branch"
git config --global user.email "travis@travis-ci.org"
git config --global user.name "travis-ci"
git clone --quiet --branch=${TARGET_BRANCH} https://${GH_TOKEN}@github.com/${REPO_SLUG} gh-pages > /dev/null

cd gh-pages
echo "Currently in ${PWD}"
# Delete the content of the branch gh-pages
git rm -rf .
# Copy the recently generated files to branch gh-pages
cp -Rf $HOME/build/${REPO_SLUG}/docs/ .

# Add to git all the files
git add -f .
# Commit and push
git commit -m "Lastest jazzy docs on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
git push -fq origin $TARGET_BRANCH > /dev/null

