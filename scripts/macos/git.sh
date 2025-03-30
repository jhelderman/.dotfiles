#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
brew install git
# global git ignore
rm $HOME/.gitignore 2> /dev/null | true
ln -s $repo_root/git/ignore $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore
