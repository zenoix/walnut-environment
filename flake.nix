{
  description = "Walnut Environment";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #INFO: Commit 3190239 breaks stylix cursors
    # stylix.url = "github:danth/stylix";
    stylix.url = "github:danth/stylix/993fcabd83d1e0ee5ea038b87041593cc73c1ebe";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      stylix,
      ...
    }@inputs:

    let
      system = "x86_64-linux";

      personal = {
        user = "zenoix";
        timeZone = "Pacific/Auckland";
        defaultLocale = "en_NZ.UTF-8";
        city = "Auckland";

        # Used for gitconfig
        gitUser = "zenoix";
        gitEmail = "41812358+zenoix@users.noreply.github.com";
      };

      wsl = {
        user = "jeffwang2";
      };
    in
    {
      # Laptop NixOS
      nixosConfigurations.walnut-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system personal;
        };
        modules = [
          ./hosts/walnut-laptop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      # Desktop NixOS
      nixosConfigurations.walnut-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system personal;
        };
        modules = [
          ./hosts/walnut-desktop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      # NixOS/personal home manager
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
          ./hosts/walnut-nixos/home.nix
          ./homeManagerModules
          inputs.stylix.homeManagerModules.stylix
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };

      # WSL home manager
      homeConfigurations.jeffwang2 = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs wsl;
        };
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./hosts/wsl/home.nix
          ./homeManagerModules
          inputs.stylix.homeManagerModules.stylix
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    };
}
