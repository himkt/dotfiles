{ pkgs, ... }:

{
  home.packages = [
    pkgs.atuin
    pkgs.coreutils
    pkgs.difftastic
    pkgs.fzf
    pkgs.jq
    pkgs.tree

    pkgs.gh
    pkgs.ghq

    pkgs.zsh-autocomplete
    pkgs.zsh-syntax-highlighting
    pkgs.zoxide

    pkgs.kubectl
    pkgs.krew
    pkgs.k9s

    pkgs.neovim

    pkgs.nixd
  ];
}
