#!/bin/bash

WINDOWS_HOME=$(wslpath `wslvar USERPROFILE`)

cp $HOME/dotfiles/autohotkey/config.d/emacs.ahk $WINDOWS_HOME/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/emacs.ahk
