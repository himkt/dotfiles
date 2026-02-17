{ pkgs, ... }:

{
  # System-level settings (replaces darwin/bin/setup.sh)
  system.defaults = {
    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 20;
      ApplePressAndHoldEnabled = false;
      "com.apple.keyboard.fnState" = false;
    };
    trackpad.Clicking = true;
    dock = {
      orientation = "left";
      autohide = true;
    };
  };

  users.users.himkt = {
    home = "/Users/himkt";
  };

  # Enable Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # Note: verify this value before first activation.
  # See https://daiderd.com/nix-darwin/manual/ for stateVersion documentation.
  system.stateVersion = 5;
}
