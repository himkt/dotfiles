#!/bin/bash

if ! command -v nix >/dev/null 2>&1; then
  sh <(curl -L https://nixos.org/nix/install)
fi

nix run nix-darwin -- switch --flake $HOME/dotfiles/nix/config.d
