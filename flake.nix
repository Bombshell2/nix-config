{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations = {
      homemachine = nixpkgs.lib.nixosSystem {
	      system = "x86_64-linux";
	      specialArgs = { inherit inputs; };
	      modules = [
          ./hosts/amd7900
	        home-manager.nixosModules.home-manager
	        {
	          home-manager = {
	            useGlobalPkgs = true;
	            useUserPackages = true;
	            sharedModules = [ nixvim.homeManagerModules.nixvim ];
	            users.bombshell2 = import ./hosts/homemachine/home.nix;
	          };
	        }
	      ];
      };
      nixlaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixlaptop
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ nixvim.homeManagerModules.nixvim ];
              users.bombshell2 = import ./hosts/nixlaptop/home.nix;
            }
          }
        ];
      };
    };
  };
}
