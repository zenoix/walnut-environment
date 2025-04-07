{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  options = {
    walnut-home.ags.enable = lib.mkEnableOption "enable ags";
  };

  config = lib.mkIf config.walnut-home.ags.enable {
    programs.ags = {
      enable = true;

      configDir = ../../../nonNix/ags;
    };

    home.packages = [ inputs.ags.packages.${pkgs.system}.hyprland ];
  };
}
