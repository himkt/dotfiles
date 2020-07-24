#! /bin/bash

rm -rf $HOME/.emacs.d/init.el
mkdir -p $HOME/.emacs.d

ln -s $PWD/emacs/config.d/init.el $HOME/.emacs.d/init.el
