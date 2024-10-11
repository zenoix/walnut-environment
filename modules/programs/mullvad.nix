{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    mullvad.enable = lib.mkEnableOption "enable mullvad";
  };

  config = lib.mkIf config.mullvad.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
