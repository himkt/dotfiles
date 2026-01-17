{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "himkt";
    userEmail = "himkt@klis.tsukuba.ac.jp";

    extraConfig = {
      credential."https://github.com" = {
        helper = "!gh auth git-credential";
      };
    };

    # Load additional config from dotfiles
    includes = [
      { path = "~/.config/git/config-extra"; }
    ];
  };

  # Additional git config (aliases, format, etc.)
  xdg.configFile."git/config-extra" = {
    source = ./files/config;
  };

  # Global gitignore
  xdg.configFile."git/ignore" = {
    source = ./files/ignore;
  };
}
