{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    home-manager.enable = lib.mkEnableOption "enable home-manager";
  };

  config = lib.mkIf config.home-manager.enable {
    environment.systemPackages = with pkgs; [ home-manager ];
  };
}
