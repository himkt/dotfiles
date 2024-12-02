{ pkgs, ... }:
{
  home.username = "himkt";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.neovim
    pkgs.nixd
    pkgs.git
    pkgs.zoxide
    pkgs.atuin
    pkgs.zsh
    pkgs.zsh-autocomplete
    pkgs.zsh-syntax-highlighting
  ];

  programs.zsh = {
    enable                    = true;
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;
  };

  programs.home-manager.enable = true;
}
