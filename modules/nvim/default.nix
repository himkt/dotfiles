{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-plug
    ];
  };

  xdg.configFile."nvim/init.vim" = {
    source = ./files/init.vim;
  };

  xdg.configFile."nvim/vimrc" = {
    source = ./files/vimrc;
  };
}
