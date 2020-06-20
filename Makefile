COMPONENTS=zsh tmux vim
ROOT=$(shell pwd)

all:

.PHONY: install 
install: $(COMPONENTS)

zsh: .zshrc
	rm ~/.zshrc 2> /dev/null | true
	ln -s $(ROOT)/.zshrc ~/.zshrc

tmux: .tmux.conf
	rm ~/.tmux.conf 2> /dev/null | true
	ln -s $(ROOT)/.tmux.conf ~/.tmux.conf

vim: .vimrc
	rm ~/.vimrc 2> /dev/null | true
	ln -s $(ROOT)/.vimrc ~/.vimrc
