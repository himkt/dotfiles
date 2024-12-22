#!/bin/bash

# https://macos-defaults.com/

# keyboard
#
# https://linkarzu.com/posts/2024-macos-workflow/macos-keyrepeat-rate/
# 
# * (todo) remap caps to control
# * key repeat rate
# * delay until repeat
#
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 20

# dock
#
# autohide     = true
# show-recents = false
# orientation  = bottom
#
defaults write com.apple.dock orientation -string bottom
defaults write com.apple.dock autohide    -bool   true
killall Dock

# menu bar
#
# only show = [Wi-Fi, VPN, Battery]
#

# finder
#

# login window
#
# guest login = false
#
