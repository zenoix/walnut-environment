{
  description = "Walnut Environment";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devbox = {
      url = "github:jetify-com/devbox";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    stylix.url = "github:danth/stylix/release-25.05";

    nixvim = {
      url = "github:nix-community/nixvim/";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    starship-jj = {
      url = "gitlab:lanastara_foss/starship-jj";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
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
        inherit
          inputs
          system
          personal
          server
          work
          ;
      };

      extraSpecialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit
          inputs
          personal
          work
          server
          ;
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

      server = {
        user = "walnut";
      };

      work = {
        user = "jeff.wang";
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
          ./hosts/walnutLaptop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      # Desktop NixOS
      nixosConfigurations.walnut-desktop = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/walnutDesktop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      # Server NixOS
      nixosConfigurations.walnut-server = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/walnutServer/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      # NixOS/personal home manager
      homeConfigurations = {
        "${personal.user}@walnut-laptop" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/walnutLaptop/home.nix
            ./homeManagerModules
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeModules.nixvim
          ];
        };

        "${personal.user}@walnut-desktop" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/walnutDesktop/home.nix
            ./homeManagerModules
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeModules.nixvim
          ];
        };

        "${server.user}@walnut-server" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/walnutServer/home.nix
            ./homeManagerModules
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeModules.nixvim
          ];
        };

        # Work WSL home manager
        "${work.user}@NZ-WPF4GDYVJ" = home-manager.lib.homeManagerConfiguration {
          inherit extraSpecialArgs pkgs;
          modules = [
            ./hosts/work-wsl/home.nix
            ./homeManagerModules
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeModules.nixvim
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
              ./hosts/workMac/home.nix
              ./homeManagerModules
              inputs.stylix.homeModules.stylix
              inputs.nixvim.homeModules.nixvim
            ];
          };
      };

      darwinConfigurations."DPGL93YXYK" = nix-darwin.lib.darwinSystem {
        modules = [
          ./darwinModules
          ./hosts/workMac/configuration.nix

          (
            { config, ... }:
            {
              homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
            }
          )
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "${work.user}";

              # Optional: Declarative tap management
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };

              # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
              mutableTaps = true;

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;
            };
          }
        ];

        inherit specialArgs;
      };
    };
}
