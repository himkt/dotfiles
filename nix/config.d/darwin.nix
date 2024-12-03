{ ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [ "root" "himkt" ];

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles      = false;
  };

  system.defaults.dock = {
    autohide     = true;
    show-recents = false;
    orientation  = "bottom";
  };

  system.defaults.controlcenter = {
    AirDrop                = false;
    BatteryShowPercentage  = false;
    Bluetooth              = false;
    Display                = false;
    FocusModes             = false;
    NowPlaying             = false;
    Sound                  = false;
  };

  # TODO(himkt); other items visibility settings (e.g. Wi-Fi).
  # It modifies the almost same entries as the following command:
  # `defaults -currentHost write com.apple.controlcenter WiFi -int 18`
  # (18: show, 24: hide)
  #
  # However, it didn't change macOS UI actually even if I explicitly ran `killall SystemUIServer`.
  # https://superuser.com/questions/398071/how-can-i-hide-show-the-wi-fi-menu-item-from-the-terminal-in-os-x
  #
  # system.defaults.CustomUserPreferences."com.apple.controlcenter" = {
  #   "NSStatusItem Preferred Position WiFi" = 18;
  #   "NSStatusItem Visible WiFi"            = 1;
  # };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
