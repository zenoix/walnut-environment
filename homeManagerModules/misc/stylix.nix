{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.stylix.enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf config.walnutHome.stylix.enable {
    stylix = {
      enable = true;
      autoEnable = false;
      enableReleaseChecks = false;
      polarity = "dark";

      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

      fonts = {
        monospace = {
          package = pkgs.monaspace;
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

      targets = {
        # Catppuccin-nix doesn't have gtk themeing so use stylix
        gtk.enable = true;
      };
    };
  };
}
