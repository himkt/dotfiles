#!/bin/bash

mkdir -p $HOME/.config/fish
ln -s $PWD/fish/config.d/config.fish $HOME/.config/fish/config.fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
DISABLE_TMUX=1 fish -c "fisher install jethrokuan/z"
DISABLE_TMUX=1 fish -c "fisher install jethrokuan/fzf"
