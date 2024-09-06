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

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ... }@inputs:

    let
      system = "x86_64-linux";

      personal = {
        user = "zenoix";
        host = "walnut-nixos";
        timeZone = "Pacific/Auckland";
        defaultLocale = "en_NZ.UTF-8";
        city = "Auckland";

        # Used for gitconfig
        gitUser = "zenoix";
        gitEmail = "41812358+zenoix@users.noreply.github.com";
      };
    in {
    # nixos - system hostname
    nixosConfigurations.${personal.host}= nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system personal;
      };
      modules = [
        ./nixos/configuration.nix
	      stylix.nixosModules.stylix
      ];
    };

    homeConfigurations.${personal.user} = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs personal;
      };
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ 
        ./home-manager/home.nix 
	      inputs.stylix.homeManagerModules.stylix
	      inputs.nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
