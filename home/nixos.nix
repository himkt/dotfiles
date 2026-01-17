{ config, pkgs, ... }:

{
  imports = [
    ../modules/zsh
    ../modules/sheldon
    ../modules/tmux
    ../modules/nvim
    ../modules/git
    ../modules/uv
    ../modules/ghostty
    ../modules/gcc
    ../modules/gpg
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "himkt";
  home.homeDirectory = "/home/himkt";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # XDG Base Directory specification
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # GUI
    _1password-gui
    google-chrome
    slack
    vscode

    # CLI
    bazelisk
    btop
    claude-code
    gh
    ghq
    gnumake
    jq
    kubectl
    kubectx
    kustomize
    k9s
    mise
    postgresql
    python3
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # Chrome with touchpad swipe gesture support
    ".local/share/applications/google-chrome.desktop".text = ''
      [Desktop Entry]
      Version=1.0
      Name=Google Chrome
      GenericName=Web Browser
      Comment=Access the Internet
      Exec=google-chrome-stable --enable-features=TouchpadOverscrollHistoryNavigation %U
      StartupNotify=true
      Terminal=false
      Icon=google-chrome
      Type=Application
      Categories=Network;WebBrowser;
      MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/himkt/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
  };

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };

    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "ctrl:nocaps" ];
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      natural-scroll = true;
      speed = 0.0;
    };
    "org/gnome/desktop/peripherals/mouse" = {
      speed = -1.0;
      natural-scroll = true;
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [
        "JetBrains Mono"
        "Noto Sans Mono CJK JP"
      ];
      sansSerif = [ "Noto Sans CJK JP" ];
      serif = [ "Noto Serif CJK JP" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
