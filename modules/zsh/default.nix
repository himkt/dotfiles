{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.zsh = {
    enable = true;
    initContent = builtins.readFile ./files/zshrc;
  };

  # Additional packages needed by zshrc
  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
