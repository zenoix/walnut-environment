{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.signal.enable = lib.mkEnableOption "enable signal";
  };

  config = lib.mkIf config.walnut.signal.enable {
    environment.systemPackages = with pkgs; [ signal-desktop ];
  };
}
