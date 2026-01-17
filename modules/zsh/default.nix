{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.zsh = {
    enable = true;
  };

  # Use custom zshrc from dotfiles
  home.file.".zshrc" = {
    source = ./files/zshrc;
  };

  # Additional packages needed by zshrc
  home.packages = with pkgs; [
    fzf
    zoxide
    sheldon # ZSH plugin manager
  ];
}
