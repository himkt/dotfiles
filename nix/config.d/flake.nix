{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { home-manager, darwin, ... }: {
    darwinConfigurations = {
      uranus = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin.nix
          home-manager.darwinModules.home-manager
          {
            users.users.himkt.home = "/Users/himkt";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.himkt = import ./home.nix ;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
}
