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

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
