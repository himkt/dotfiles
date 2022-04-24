#!/bin/bash

case `uname -s` in
Darwin*)
  ln -s $HOME/dotfiles/cargo-atcoder/config/cargo-atcoder.toml $HOME/Library/Application\ Support/cargo-atcoder.toml
  ;;
Linux*)
  ln -s $HOME/dotfiles/cargo-atcoder/config/cargo-atcoder.toml $HOME/.config/cargo-atcoder.toml
  ;;
esac

cargo install cargo-atcoder
