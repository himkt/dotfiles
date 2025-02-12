#!/bin/bash

mkdir -p $HOME/.config/ghostty

ln -s \
  $HOME/dotfiles/ghostty/config.d/config \
  $HOME/.config/ghostty/config
