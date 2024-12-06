{ ... }:

{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [ "root" "himkt" ];

  imports = [
    ./darwin/system/defaults/controlcenter.nix
    ./darwin/system/defaults/dock.nix
    ./darwin/system/defaults/finder.nix
    ./darwin/system/defaults/NSGlobalDomain.nix
    ./darwin/system/defaults/loginwindow.nix
    ./darwin/system/keyboard.nix
    ./darwin/security/pam.nix
    ./darwin/homebrew.nix
    ./darwin/font.nix
    ./darwin/environment/systemPackages.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
