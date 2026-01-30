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
    shellAliases = {
      open = "xdg-open";
    };
  };

  # Additional packages needed by zshrc
  home.packages = with pkgs; [
    fzf
    zoxide
  ];
}
