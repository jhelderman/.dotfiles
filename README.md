# dotfiles

This repository contains dotfiles for multiple operating systems. The installation
is managed by `run.sh` and there is a makefile with convenience targets for the
various operating systems. The following commands are available:

```bash
# macos
make macos
# ubuntu
# add deb-src to /etc/apt/sources.list or /etc/apt/sources.list.d/ubuntu.sources
# prior to running this target
make ubuntu
# arch
make arch
```
