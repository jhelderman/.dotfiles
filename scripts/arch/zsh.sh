#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
sudo pacman -S zsh
# install configuration
rm $HOME/.zshrc 2> /dev/null | true
ln -s $repo_root/.zshrc $HOME/.zshrc
rm $HOME/.user-env.sh 2> /dev/null | true
ln -s $repo_root/.user-env.sh $HOME/.user-env.sh
# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# oh-my-zsh
sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
