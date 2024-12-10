#!/bin/bash

mkdir -p "$HOME/.config/sheldon"
ln -s "$PWD/sheldon/config.d/plugins.toml" "$HOME/.config/sheldon/plugins.toml"
