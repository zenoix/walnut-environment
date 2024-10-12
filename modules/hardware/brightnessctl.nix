{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.brightnessctl.enable = lib.mkEnableOption "enable brightnessctl";
  };

  config = lib.mkIf config.walnut.brightnessctl.enable {
    environment.systemPackages = with pkgs; [ brightnessctl ];
  };
}
