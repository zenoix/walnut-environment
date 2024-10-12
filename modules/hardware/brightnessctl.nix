{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    brightnessctl.enable = lib.mkEnableOption "enable brightnessctl";
  };

  config = lib.mkIf config.brightnessctl.enable {
    environment.systemPackages = with pkgs; [ brightnessctl ];
  };
}
