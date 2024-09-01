{
  description = "Walnut Environment";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ... }@inputs:

    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
      };
    in {
    # nixos - system hostname
    nixosConfigurations."walnut-nixos" = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit system;
      };
      modules = [
        ./nixos/configuration.nix
	stylix.nixosModules.stylix
      ];
    };

    homeConfigurations.zenoix = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit pkgs-unstable;
	inherit inputs;
      };
      modules = [ 
        ./home-manager/home.nix 
	inputs.stylix.homeManagerModules.stylix
	inputs.nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
