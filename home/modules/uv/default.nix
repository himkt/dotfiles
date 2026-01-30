{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    uv
  ];

  xdg.configFile."uv/uv.toml" = {
    source = ./files/uv.toml;
  };
}
