{
  pkgs,
  inputs,
  ...
}:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
  };
in

{
  programs.mise = {
    enable = true;
    package = unstable.mise;
    enableZshIntegration = true;

    globalConfig = {
      tools = {
        "aqua:anthropics/claude-code" = "latest";
      };

      settings = {
        all_compile = false;
        experimental = true;
        disable_backends = [ "asdf" ];
      };
    };
  };
}
