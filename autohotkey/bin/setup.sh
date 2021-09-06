#!/bin/bash

WINDOWS_HOME=$(wslpath `wslvar USERPROFILE`)

cp $HOME/dotfiles/autohotkey/config.d/minimum.ahk $WINDOWS_HOME/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/minimum.ahk
