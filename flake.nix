{
  description = "Walnut Environment";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devbox = {
      url = "github:jetify-com/devbox";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    stylix.url = "github:danth/stylix/release-24.11";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
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
      inherit (self) outputs;
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        inherit overlays;
      };

      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system personal;
      };

      extraSpecialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs personal work;
      };

      personal = {
        user = "zenoix";
        timeZone = "Pacific/Auckland";
        defaultLocale = "en_NZ.UTF-8";
        city = "Auckland";

        # Used for gitconfig
        gitUser = "zenoix";
        gitEmail = "41812358+zenoix@users.noreply.github.com";

        # For gammastep
        latitude = 36.8509;
        longitude = 174.7645;
      };

      work = {
        user = "jeffwang2";
      };

      overlays = import ./overlays {
        inherit inputs outputs system;
        inherit (nixpkgs) lib;
      };
    in
    {
      # Laptop NixOS
      nixosConfigurations.walnut-laptop = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/walnut-laptop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      # Desktop NixOS
      nixosConfigurations.walnut-desktop = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/walnut-desktop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      # NixOS/personal home manager
      homeConfigurations = {
        "${personal.user}@walnut-laptop" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/walnut-laptop/home.nix
            ./homeManagerModules
            inputs.stylix.homeManagerModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };

        "${personal.user}@walnut-desktop" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/walnut-desktop/home.nix
            ./homeManagerModules
            inputs.stylix.homeManagerModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };

        # Work WSL home manager
        "${work.user}@NZ-WPF4GDYVJ" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/work-wsl/home.nix
            ./homeManagerModules
            inputs.stylix.homeManagerModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };

        # Work Mac home manager
        # For some reason the host name keeps changing so no host name here
        "${work.user}" =
          let
            system = "aarch64-darwin";
          in
          home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
              inherit system;
              overlays = import ./overlays {
                inherit inputs outputs system;
                inherit (nixpkgs) lib;
              };
            };

            extraSpecialArgs = {
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
              inherit inputs personal work;
            };

            modules = [
              ./hosts/work-mac/home.nix
              ./homeManagerModules
              inputs.stylix.homeManagerModules.stylix
              inputs.nixvim.homeManagerModules.nixvim
            ];
          };
      };
    };
}
