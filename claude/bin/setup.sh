#!/bin/bash

mkdir -p $HOME/.claude/bin
ln -s $PWD/claude/bin/status.py $HOME/.claude/bin/status.py
ln -s $PWD/claude/config.d/settings.json $HOME/.claude/settings.json
