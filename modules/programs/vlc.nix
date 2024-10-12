{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.vlc.enable = lib.mkEnableOption "enable vlc";
  };

  config = lib.mkIf config.walnut.vlc.enable { environment.systemPackages = with pkgs; [ vlc ]; };
}
