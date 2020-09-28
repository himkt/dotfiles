#!/bin/bash

mkdir -p $HOME/.config/git
rm -f $HOME/.config/git/ignore
ln -s $HOME/dotfiles/git/config.d/ignore $HOME/.config/git/ignore
