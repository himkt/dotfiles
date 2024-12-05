{ pkgs, config, ... }:
{
  home.username = "himkt";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.atuin
    pkgs.coreutils
    pkgs.difftastic
    pkgs.fzf
    pkgs.jq
    pkgs.tree

    pkgs.git
    pkgs.git-lfs
    pkgs.gh
    pkgs.ghq

    pkgs.zsh
    pkgs.zsh-autocomplete
    pkgs.zsh-syntax-highlighting
    pkgs.zoxide

    pkgs.kubectl
    pkgs.krew
    pkgs.k9s

    pkgs.neovim

    pkgs.nixd
  ];

  # NOTE(himkt); https://github.com/nix-community/home-manager/blob/master/modules/programs/zsh.nix
  # (different from https://github.com/NixOS/nixpkgs/blob/nixos-24.11/nixos/modules/programs/zsh/zsh.nix)
  programs.zsh = {
    enable                    = true;
    enableCompletion          = true;
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 100000;
    };

    shellAliases = {
      git-home = "cd `git rev-parse --show-toplevel`";
      t        = "tips";
      vim      = "nvim";
      cd       = "z";
      ls       = "ls --color";
      retcode  = "echo $?";
    };


    initExtra = ''
      source ${config.home.homeDirectory}/dotfiles/zsh/config.d/zshrc
    '';
  };

  programs.home-manager.enable = true;
}
