{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    walnut.mullvad.enable = lib.mkEnableOption "enable mullvad";
  };

  config = lib.mkIf config.walnut.mullvad.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
