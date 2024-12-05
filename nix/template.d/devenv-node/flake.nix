{
  description = "devenv";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs {
      system = "aarch64-darwin";
    };

    shell = pkgs.mkShellNoCC {
      packages = [
        pkgs.nodejs_22
        pkgs.nodePackages.pnpm
      ];
      shellHook = ''
        export SHELL=$(which zsh)
        exec $SHELL
      '';
    };
  in {
    devShells = {
      aarch64-darwin.default = shell;
    };
  };
}
