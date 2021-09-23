#!/bin/bash

WINDOWS_HOME=$(wslpath `wslvar USERPROFILE`)
rm -f $WINDOWS_HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
