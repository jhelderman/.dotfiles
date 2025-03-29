#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
sudo pacman -S vim
# install configuration
rm $HOME/.vimrc 2> /dev/null | true
ln -s $repo_root/.vimrc $HOME/.vimrc
