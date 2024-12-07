{ ... }:

{
  programs.git = {
    enable  = true;
    aliases = {
      remove-merged = "!remove-merged-branches";
    };

    userEmail = "himkt@klis.tsukuba.ac.jp";
    userName  = "himkt";

    ignores = [
      ".vim"
      ".vscode"
      ".rakeTasks"
      ".rubocop.yml"
      ".venv"
      "*.egg-info"
      ".mypy_cache"
      ".idea"
      ".DS_Store"
    ];

    lfs = {
      enable = true;
    };

    extraConfig = {
      format = {
        pretty = "format:%C(yellow)%h %C(green)%cd %C(reset)%s %C(red)%d %C(cyan)[%an]";
        date   = "iso";
      };
      pull = {
        rebase = "false";
      };
    };
  };
}
