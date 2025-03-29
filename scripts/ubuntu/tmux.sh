#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
sudo apt install tmux
# install configuration
rm $HOME/.tmux 2> /dev/null | true
ln -s $repo_root/.tmux/ $HOME/.tmux
rm $HOME/.tmux.conf 2> /dev/null | true
ln -s $repo_root/.tmux.conf $HOME/.tmux.conf
