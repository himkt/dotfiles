#!/bin/bash

mkdir -p $HOME/.config/git

rm -rf $HOME/.config/git/config
rm -rf $HOME/.config/git/ignore

ln -s $HOME/dotfiles/git/config.d/config $HOME/.config/git/config
ln -s $HOME/dotfiles/git/config.d/ignore $HOME/.config/git/ignore
