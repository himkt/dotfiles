{
  description = "devenv";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs {
      system = "x86_64-darwin";
    };

    uv = import ./uv.nix { inherit pkgs; };
    shell = pkgs.mkShellNoCC {
      packages = [
        uv
      ];
      shellHook = ''
        export SHELL=$(which zsh)
        exec $SHELL
      '';
    };
  in {
    devShells = {
      x86_64-darwin.default  = shell;
      aarch64-darwin.default = shell;
    };
  };
}
