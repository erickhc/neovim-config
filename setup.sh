#!/bin/sh

git submodule update --recursive --init
mkdir $HOME/.local/share/nvim
ln -s $HOME/.config/nvim/site $HOME/.local/share/nvim/site
mkdir -p site/pack/coc/start
cd site/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
