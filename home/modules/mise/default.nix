{
  pkgs,
  inputs,
  ...
}:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
  };
in

{
  programs.mise = {
    enable = true;
    package = unstable.mise;
    enableZshIntegration = true;
  };
}
