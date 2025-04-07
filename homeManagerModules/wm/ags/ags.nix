{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.ags.enable = lib.mkEnableOption "enable ags";
  };

  config = lib.mkIf config.walnut-home.ags.enable {
    programs.ags = {
      enable = true;

      configDir = ../ags;
    };
  };
}
