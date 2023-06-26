COMPONENTS=zsh tmux vim nvim
ROOT=$(shell pwd)

all:

.PHONY: install 
install: $(COMPONENTS)

.PHONY: zsh
zsh: .zshrc
	rm ~/.zshrc 2> /dev/null | true
	ln -s $(ROOT)/.zshrc ~/.zshrc
	rm ~/.user-env.sh 2> /dev/null | true
	ln -s $(ROOT)/.user-env.sh ~/.user-env.sh

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


.PHONY: picom
picom:
	rm ~/.config/picom 2> /dev/null | true
	ln -s $(ROOT)/picom ~/.config/picom


.PHONY: alacritty
alacritty:
	cd deps/alacritty && \
		cargo build --release && \
		sudo cp target/release/alacritty /usr/local/bin
	rm ~/.config/alacritty 2> /dev/null | true
	ln -s $(ROOT)/alacritty ~/.config/alacritty

.PHONY: ubuntu-deps
ubuntu-deps:
	# alacritty deps
	sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	pip3 install bumblebee-status
