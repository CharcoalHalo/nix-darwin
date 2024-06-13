{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-services = {
      url = "github:homebrew/homebrew-services";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs, homebrew-services, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle }:
  let 
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Fletchers-MacBook-Air
    darwinConfigurations."Fletchers-MacBook-Air" = nix-darwin.lib.darwinSystem {
      inherit inputs;
      system = "aarch64-darwin";
      modules = [ 
        ./configuration.nix
        home-manager.darwinModules.home-manager
        {
	        home-manager.useGlobalPkgs = true;
	        home-manager.useUserPackages = true;
	        home-manager.users.fbright = import ./home-manager.nix;
	        #  home-manager.extraSpecialArgs = ;
        }
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = false;

            user = "fbright";
            # Can add third party taps(repos)
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
              "homebrew/homebrew-services" = homebrew-services;
            };
            # Disables the addition of taps with `brew tap`
            mutableTaps = false;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Fletchers-MacBook-Air".pkgs;
  };
}
