#!/usr/bin/env bash
repo_root=$(dirname $(dirname $(cd $(dirname "${BASH_SOURCE[0]}") && pwd)))
brew install tmux
# install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
# install configuration
rm $HOME/.config/tmux 2> /dev/null | true
ln -s $repo_root/tmux/ $HOME/.config/tmux
rm $HOME/.local/bin/init-tmux 2> /dev/null | true
ln -s $repo_root/tmux-sessionizer/init-tmux $HOME/.local/bin/init-tmux
rm $HOME/.local/bin/tmux-sessionizer 2> /dev/null | true
ln -s $repo_root/tmux-sessionizer/tmux-sessionizer $HOME/.local/bin/tmux-sessionizer
