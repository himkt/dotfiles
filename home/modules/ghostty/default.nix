{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    pkgs.ghostty
  ];

  xdg.configFile."ghostty/config" = {
    source = ./files/config;
  };
}
