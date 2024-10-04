{ pkgs, pkgs-unstable, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs-unstable.obs-studio;
  };

  xdg.configFile."obs-studio/themes/Catppuccin_Mocha.ovt" = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/obs/refs/heads/main/themes/Catppuccin_Mocha.ovt";
      sha256 = "sha256-6jatJRRojATjSjKDoOP6U1av927uoP1fQh4EB8+gfgs=";
    };
  };
}
