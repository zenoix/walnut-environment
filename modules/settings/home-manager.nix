{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.home-manager.enable = lib.mkEnableOption "enable home-manager";
  };

  config = lib.mkIf config.walnut.home-manager.enable {
    environment.systemPackages = with pkgs; [ home-manager ];
  };
}
