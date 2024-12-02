#!/bin/bash

# mkdir -p $HOME/.config/nix
# ln -s $PWD/nix/config.d/nix.conf $HOME/.config/nix

mkdir -p $HOME/.config/nix-darwin
cp $PWD/nix/config.d/flake.nix $HOME/.config/nix-darwin
