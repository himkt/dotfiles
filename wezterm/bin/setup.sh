#!/bin/bash
set -x

mkdir -p $HOME/.config/wezterm
ln -s $HOME/dotfiles/wezterm/config.d/wezterm.lua $HOME/.config/wezterm/wezterm.lua
