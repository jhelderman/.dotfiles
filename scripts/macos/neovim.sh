#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
# dependencies
brew install ninja cmake gettext curl
# get the code
if [ ! -d $HOME/code/neovim ]; then
    git clone https://github.com/neovim/neovim.git $HOME/code/neovim
fi
cd $HOME/code/neovim
git fetch
git checkout v0.11.0
# build
make CMAKE_BUILD_TYPE=RelWithDebInfo --prefix=$HOME/.local
# install binaries
make CMAKE_INSTALL_PREFIX=$HOME/.local install
# install configuration
mkdir -p $HOME/.config 2> /dev/null | true
rm -rf $HOME/.config/nvim 2> /dev/null | true
ln -s $repo_root/nvim $HOME/.config/nvim
