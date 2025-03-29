#!/usr/bin/env bash
# install dependencies
sudo apt-get build-dep python3
sudo apt-get install pkg-config
sudo apt-get install build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev
# get the source code
cd $HOME/code/
if [ ! -f Python-3.11.10.tgz ]; then
    wget https://www.python.org/ftp/python/3.11.10/Python-3.11.10.tgz
fi
if [ ! -d Python-3.11.10 ]; then
    tar -xzf Python-3.11.10.tgz
fi
cd Python-3.11.10
# build and install
./configure --prefix $HOME/.local --enable-optimizations
make -j4
make install
