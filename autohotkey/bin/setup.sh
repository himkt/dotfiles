#!/bin/bash

TARGET=windows.ahk
WINDOWS_HOME=$(wslpath `wslvar USERPROFILE`)

cp $HOME/dotfiles/autohotkey/config.d/$TARGET $WINDOWS_HOME/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/$TARGET
