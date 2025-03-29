#!/usr/bin/env bash
brew install pkg-config openssl@3 xz gdbm tcl-tk mpdecimal
cd $HOME/code/
if [ ! -f Python-3.11.10.tgz ]; then
    wget https://www.python.org/ftp/python/3.11.10/Python-3.11.10.tgz
fi
if [ ! -d Python-3.11.10 ]; then
    tar -xzf Python-3.11.10.tgz
fi
cd Python-3.11.10
GDBM_CFLAGS="-I$(brew --prefix gdbm)/include" \
    GDBM_LIBS="-L$(brew --prefix gdbm)/lib -lgdbm" \
    ./configure \
    --prefix $HOME/.local \
    --enable-optimizations \
    --with-pydebug \
    --with-openssl="$(brew --prefix openssl@3)"
make -j4
make install
if [ ! -d $HOME/.local/envs/py311 ]; then
    mkdir -p $HOME/.local/envs 2> /dev/null | true
    $HOME/.local/bin/python3 -m venv $HOME/.local/envs/py311
fi
