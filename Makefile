ROOT=$(shell pwd)

all:

.PHONY: macos
macos:
	./run.sh -f macos

.PHONY: ubuntu
ubuntu:
	./run.sh -f ubuntu

.PHONY: arch
arch:
	./run.sh -f arch
