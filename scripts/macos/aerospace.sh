#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
# aerospace
brew install --cask nikitabobko/tap/aerospace
# install config
mkdir -p $HOME/.config 2> /dev/null | true
rm $HOME/.config/aerospace 2> /dev/null | true
ln -s $repo_root/aerospace $HOME/.config/aerospace
