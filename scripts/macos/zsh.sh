#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
brew install zsh
# install configuration
rm $HOME/.zshrc 2> /dev/null | true
ln -s $repo_root/.zshrc $HOME/.zshrc
rm $HOME/.user-env.sh 2> /dev/null | true
ln -s $repo_root/.user-env.sh $HOME/.user-env.sh
# oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# zsh autosuggestions
if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/ ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
# powerlevel10k
if [ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi
