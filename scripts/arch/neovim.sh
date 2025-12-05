#!/usr/bin/env bash
# dependencies
sudo pacman -S base-devel cmake ninja curl
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
