{
  pkgs,
  pkgs-unstable,
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
      polarity = "dark";

      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

      # Stylix needs an image for some reason
      image = ../../assets/fuji-palette.png;

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

      targets = {
        waybar.enable = false;
        hyprlock.enable = false;
        neovim.enable = false;
        nixvim.enable = false;
        kitty.variant256Colors = true;
        tmux.enable = false;
      };
    };
  };
}
