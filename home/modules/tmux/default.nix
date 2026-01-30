{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./files/tmux.conf;
  };
}
