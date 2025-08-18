{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.stylix.enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf config.walnut.stylix.enable {
    environment.systemPackages = with pkgs; [ base16-schemes ];

    stylix = {
      enable = true;
      autoEnable = false;
      polarity = "dark";

      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

      targets = {
        grub.enable = false;
      };

      fonts = {
        monospace = {
          package = pkgs-unstable.monaspace;
          name = "Monaspace Neon";
        };
      };

      cursor = {
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "catppuccin-mocha-dark-cursors";
        size = 12;
      };

      opacity = {
        applications = 0.975;
        desktop = 0.975;
        terminal = 0.975;
        popups = 0.975;
      };
    };
  };
}
