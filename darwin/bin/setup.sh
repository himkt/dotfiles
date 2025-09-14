#!/bin/bash

# https://macos-defaults.com/

# keyboard
#
# https://linkarzu.com/posts/2024-macos-workflow/macos-keyrepeat-rate/
# 
# * (todo) remap caps to control
# * key repeat rate
# * delay until repeat
# * F1, F2, ...etc behave as standard function keys
#
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 20
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# dock
#
# autohide     = true
# show-recents = false
# orientation  = bottom
#
defaults write com.apple.dock orientation -string left
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

# pam
sudo rm -rf /etc/pam.d/sudo_local
cat /etc/pam.d/sudo_local.template \
  | sed -e 's/#auth/auth/g' \
  | sudo tee /etc/pam.d/sudo_local >/dev/null
