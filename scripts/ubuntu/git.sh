#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
sudo apt install git
# global git ignore
git config --global core.excludesfile $repo_root/.gitignore
