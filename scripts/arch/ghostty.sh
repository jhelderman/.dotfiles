#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
sudo pacman -S ghostty
# install config
mkdir -p $HOME/.config 2> /dev/null | true
rm -rf $HOME/.config/ghostty 2> /dev/null | true
ln -s $repo_root/ghostty $HOME/.config/ghostty
