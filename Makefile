ROOT=$(shell pwd)

all:

.PHONY: macos
macos:
	./run.sh -f macos

.PHONY: yabai
yabai:
	rm ~/.config/yabai 2> /dev/null | true
	ln -s $(ROOT)/yabai ~/.config/yabai

.PHONY: skhd
skhd:
	rm ~/.config/skhd 2> /dev/null | true
	ln -s $(ROOT)/skhd ~/.config/skhd

.PHONY: picom
picom:
	rm ~/.config/picom 2> /dev/null | true
	ln -s $(ROOT)/picom ~/.config/picom

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

.PHONY: ubuntu-deps
ubuntu-deps:
	sudo apt install -y zsh tmux curl neovim ninja-build gettext cmake unzip nodejs npm python3 python3-pip
	# alacritty deps
	sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	pip3 install bumblebee-status
