COMPONENTS=zsh tmux vim nvim
ROOT=$(shell pwd)

all:

.PHONY: install 
install: $(COMPONENTS)

.PHONY: zsh
zsh: .zshrc
	rm ~/.zshrc 2> /dev/null | true
	ln -s $(ROOT)/.zshrc ~/.zshrc

.PHONY: tmux
tmux: .tmux.conf
	rm ~/.tmux.conf 2> /dev/null | true
	ln -s $(ROOT)/.tmux.conf ~/.tmux.conf

.PHONY: vim
vim: .vimrc
	rm ~/.vimrc 2> /dev/null | true
	ln -s $(ROOT)/.vimrc ~/.vimrc

.PHONY: nvim
nvim:
	rm -rf ~/.config/nvim 2> /dev/null | true
	ln -s $(ROOT)/nvim ~/.config/nvim
