{
  description = "Goddard nix-darwin system flake";

  inputs = {
    # Remote
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Local
    nixvim-config.url = "./nixvim";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nix-homebrew, home-manager, nixvim-config }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#goddard
    darwinConfigurations."MacBook-Pro-de-Nathan" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules
        nixvim-config.darwinModules.default
        home-manager.darwinModules.home-manager {
          users.users.nathannepper = {
            name = "nathannepper";
            home = "/Users/nathannepper";
          };
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bckp";
            users.nathannepper = import ./home;
          };
        }
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "nathannepper";
          };
        }
      ];
    };
  };
}
