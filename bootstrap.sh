#!/bin/zsh

# If I run this in my home directory, cd into the right folder
cd "$(dirname "$0")"

# Update the repo
git pull

#FIXME: Warn me I'm gonna lose the changes I've done outside the repo
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
