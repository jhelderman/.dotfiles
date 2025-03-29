#!/usr/bin/env bash
cd $HOME/.local/
rm -rf $HOME/.local/go 2> /dev/null | true
if [ ! -f go1.24.1.darwin-arm64.tar.gz ]; then
  wget https://go.dev/dl/go1.24.1.darwin-arm64.tar.gz
  tar -xzf go1.24.1.darwin-arm64.tar.gz
fi
