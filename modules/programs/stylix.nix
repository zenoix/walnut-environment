{
  pkgs,
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
      polarity = "dark";

      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

      targets = {
        grub.enable = false;
      };

      # Stylix needs an image for some reason
      image = ../../assets/fuji-palette.png;

      fonts = {
        monospace = {
          package = pkgs.jetbrains-mono;
          name = "JetBrainsMono";
        };
      };

      cursor = {
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "catppuccin-mocha-dark-cursors";
        size = 24;
      };

      opacity = {
        applications = 0.95;
        desktop = 0.95;
        terminal = 0.95;
        popups = 0.95;
      };
    };
  };
}