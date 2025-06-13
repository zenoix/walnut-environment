{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.obs.enable = lib.mkEnableOption "enable obs";
  };

  config = lib.mkIf config.walnut-home.obs.enable {
    programs.obs-studio = {
      enable = true;
      package = pkgs-unstable.obs-studio;
    };

    xdg.configFile."obs-studio/themes/Catppuccin_Mocha.ovt" = {
      source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/catppuccin/obs/refs/heads/main/themes/Catppuccin_Mocha.ovt";
        sha256 = "sha256-xItrF0igUTAdh9+vngMbzrQKJO7HjXcKT06mnfVadgY=";
      };
    };
  };
}
