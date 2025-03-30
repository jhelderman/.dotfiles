#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
sudo apt install tmux
# install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
# install configuration
rm $HOME/.config/tmux 2> /dev/null | true
ln -s $repo_root/tmux/ $HOME/.config/tmux
