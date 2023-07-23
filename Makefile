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

.PHONY: oh-my-zsh
oh-my-zsh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

.PHONY: tmux
tmux: .tmux.conf
	rm ~/.tmux 2> /dev/null | true
	ln -s $(ROOT)/.tmux/ ~/.tmux
	rm ~/.tmux.conf 2> /dev/null | true
	ln -s $(ROOT)/.tmux.conf ~/.tmux.conf

.PHONY: vim
vim: .vimrc
	rm ~/.vimrc 2> /dev/null | true
	ln -s $(ROOT)/.vimrc ~/.vimrc

.PHONY: nvim
nvim:
	cd deps/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
	rm -rf ~/.config/nvim 2> /dev/null | true
	ln -s $(ROOT)/nvim ~/.config/nvim


.PHONY: picom
picom:
	rm ~/.config/picom 2> /dev/null | true
	ln -s $(ROOT)/picom ~/.config/picom

downloads/.exists:
	mkdir -p downloads 2> /dev/null | true
	touch downloads/.exists

.PHONY: go-linux
go-linux: downloads/.exists
	wget https://go.dev/dl/go1.20.6.linux-amd64.tar.gz -O downloads/go.tar.gz
	sudo rm -rf /usr/local/go 2> /dev/null | true
	sudo tar -C /usr/local -xzf downloads/go.tar.gz

.PHONY: alacritty
alacritty:
	cd deps/alacritty && \
		cargo build --release && \
		sudo cp target/release/alacritty /usr/local/bin && \
		sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg && \
		sudo desktop-file-install extra/linux/Alacritty.desktop && \
		sudo update-desktop-database
	rm ~/.config/alacritty 2> /dev/null | true
	ln -s $(ROOT)/alacritty ~/.config/alacritty

.PHONY: rust
rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

.PHONY: ubuntu-deps
ubuntu-deps:
	sudo apt install -y zsh tmux curl neovim ninja-build gettext cmake unzip nodejs npm python3 python3-pip
	# alacritty deps
	sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	pip3 install bumblebee-status
