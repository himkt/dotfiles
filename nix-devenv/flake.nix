{
  description = "devenv";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    devShell = let
      pkgs = import nixpkgs {
        system = "x86_64-darwin";
      };

      uv = import ./uv.nix { inherit pkgs; };

      shell = pkgs.mkShell {
        buildInputs = [
          uv
        ];
        shellHook = ''
          export SHELL=$(which zsh)
          exec $SHELL
        '';
      };
    in {
      x86_64-darwin  = shell;
      aarch64-darwin = shell;
    };
  };
}
