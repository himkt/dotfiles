{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    sheldon
  ];

  xdg.configFile."sheldon/plugins.toml" = {
    source = ./files/plugins.toml;
  };
}
