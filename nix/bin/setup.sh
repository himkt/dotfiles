#!/bin/bash

mkdir -p $HOME/.config/nix
ln -s $PWD/nix/config.d/nix.conf $HOME/.config/nix
