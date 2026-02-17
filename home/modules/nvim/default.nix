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
      vim-easymotion
      tabular
      fzf-vim
      vim-indent-guides
      vim-anzu
      vim-airline
      vim-polyglot
    ];
  };

  xdg.configFile."nvim/init.vim" = {
    source = ./files/init.vim;
  };

  xdg.configFile."nvim/vimrc" = {
    source = ./files/vimrc;
  };
}
