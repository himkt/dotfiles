#!/bin/bash

mkdir -p $HOME/Library/Application\ Support/com.mitchellh.ghostty

ln -s \
  $HOME/dotfiles/ghostty/config.d/config \
  $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
