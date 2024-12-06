{ config, ... }:

{
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
}
