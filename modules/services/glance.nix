{ lib, config, ... }:
{

  options = {
    walnut.glance.enable = lib.mkEnableOption "enable glance";
  };

  config = lib.mkIf config.walnut.glance.enable {
    services.glance.enable = true;
  };
}
