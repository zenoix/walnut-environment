{ lib, config, ... }:
{
  options = {
    walnut.tlp.enable = lib.mkEnableOption "enable tlp";
  };

  config = lib.mkIf config.walnut.tlp.enable {
    services.tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };
  };
}
