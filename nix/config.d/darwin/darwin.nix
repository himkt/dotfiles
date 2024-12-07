{ ... }:

{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [ "root" "himkt" ];

  imports = [
    ./environment/systemPackages.nix
    ./fonts/packages.nix
    ./homebrew.nix
    ./system/defaults/controlcenter.nix
    ./system/defaults/dock.nix
    ./system/defaults/finder.nix
    ./system/defaults/NSGlobalDomain.nix
    ./system/defaults/loginwindow.nix
    ./system/keyboard.nix
    ./security/pam.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
