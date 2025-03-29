#!/usr/bin/env bash
sudo apt install unzip
mkdir -p $HOME/.local/share/fonts 2> /dev/null | true
cd $HOME/.local/share/fonts
if [ ! -f GeistMono.zip ]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/GeistMono.zip
fi
unzip GeistMono.zip -d .local/share/fonts
fc-cache -fv
