{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.vesktop.enable = lib.mkEnableOption "enable vesktop";
  };

  config = lib.mkIf config.walnut.vesktop.enable {
    environment.systemPackages = with pkgs-unstable; [ vesktop ];
  };
}
