{ ... }:

{
  homebrew = {
    enable = true;
    casks  = [
      "arc"
      "font-jetbrains-mono"
      "docker"
      # "notion"
      "ngrok"
      "insomnia"
      "slack"
      "visual-studio-code"
      "wezterm"
      "1password"
    ];
    onActivation.cleanup = "uninstall";
  };
}
