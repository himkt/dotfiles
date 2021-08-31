#!/bin/bash

WINDOWS_HOME=$(wslpath `wslvar USERPROFILE`)
rm -f $WINDOWS_HOME/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/emacs.ahk
rm -f $WINDOWS_HOME/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/windows.ahk
