#!/bin/bash

WINDOWS_HOME=$(wslpath `wslvar USERPROFILE`)

cp $HOME/dotfiles/windows-terminal/config.d/settings.json \
    $WINDOWS_HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
