#!/bin/sh

# If a command fails then the deploy stops
set -e

# Commit message
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

# Commit Content

git add .
git commit --allow-empty -m "$msg"
gsed -i "/contentcommithash/c \\\tcontentcommithash = \"$(git rev-parse HEAD)\"" config.toml
gsed -i "/contentcommitdate/c \\\tcontentcommitdate = \"$(git log --pretty=format:"%cd" $(git rev-parse HEAD) -1)\"" config.toml
gsed -i "/contentcommitcomment/c \\\tcontentcommitcomment = \"$(git log --pretty=format:"%s" $(git rev-parse HEAD) -1)\"" config.toml

# Get Theme version
cd themes/ztyblog
gsed -i "/themecommithash/c \\\tthemecommithash = \"$(git rev-parse HEAD)\"" ../../config.toml
gsed -i "/themecommitdate/c \\\tthemecommitdate = \"$(git log --pretty=format:"%cd" $(git rev-parse HEAD) -1)\"" ../../config.toml
gsed -i "/themecommitcomment/c \\\tthemecommitcomment = \"$(git log --pretty=format:"%s" $(git rev-parse HEAD) -1)\"" ../../config.toml
cd ../..

# Commit public
hugo -t ztyblog # Build the project.
cd public
git add .
git commit --allow-empty -m "$msg"
gsed -i "/binarycommithash/c \\\tbinarycommithash = \"$(git rev-parse HEAD)\"" ../config.toml
gsed -i "/binarycommitdate/c \\\tbinarycommitdate = \"$(git log --pretty=format:"%cd" $(git rev-parse HEAD) -1)\"" ../config.toml
cd ..

# Commit content to Github
printf "\033[0;32mCommit content to GitHub...\033[0m\n"
git push origin master

# Deploy
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
cd public
git push origin master