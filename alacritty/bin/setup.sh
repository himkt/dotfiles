#! /bin/sh

mkdir -p $HOME/.config/alacritty
ln -s `pwd`/alacritty/config.d/init.yml $HOME/.config/alacritty/alacritty.yml

echo 'finish creating the alacritty environment!'
