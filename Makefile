COMPONENTS=zsh
ROOT=$(shell pwd)

all:

.PHONY: install 
install: $(COMPONENTS)

zsh:
	rm ~/.zshrc 2> /dev/null
	ln -s $(ROOT)/.zshrc ~/.zshrc
