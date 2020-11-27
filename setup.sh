#!/bin/sh

git submodule update --recursive --init
mkdir -p $HOME/.local/share/nvim
ln -s $HOME/.config/nvim/site $HOME/.local/share/nvim/site
