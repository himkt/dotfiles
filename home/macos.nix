{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    # Shared modules (same 7 as NixOS)
    ./modules/zsh
    ./modules/sheldon
    ./modules/tmux
    ./modules/nvim
    ./modules/git
    ./modules/uv
    ./modules/ghostty
    # macOS-specific modules
    ./modules/mise
  ];

  home.username = "himkt";
  home.homeDirectory = "/Users/himkt";
  home.stateVersion = "25.11";

  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
  };

  home.packages = with pkgs; [
    ghq
    python3
    rustup
    tree
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # macOS-specific platform overrides
  programs.git.settings.credential."https://github.com".helper =
    lib.mkForce "!/opt/homebrew/bin/gh auth git-credential";

  programs.tmux.extraConfig = lib.mkAfter ''
    # macOS clipboard integration
    bind-key -T copy-mode-vi y     send -X copy-selection-and-cancel\; run "tmux save -|pbcopy"
    bind-key -T copy-mode-vi Enter send -X copy-selection-and-cancel\; run "tmux save -|pbcopy"
  '';

  programs.mise.globalConfig = {
    tools = {
      gcloud = "latest";
    };
    settings = {
      idiomatic_version_file_enable_tools = [];
    };
  };

  programs.home-manager.enable = true;
}
