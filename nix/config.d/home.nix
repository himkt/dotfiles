{ ... }:

{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
  home.username = "himkt";

  imports = [
    ./home/shell.nix
    ./home/packages.nix
  ];

  programs.home-manager.enable = true;
}
