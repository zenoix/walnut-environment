{
  personal,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.gammastep.enable = lib.mkEnableOption "enable gammastep config";
  };

  config = lib.mkIf config.walnut-home.gammastep.enable {
    services.gammastep = {
      enable = true;
      latitude = personal.latitude;
      longitude = personal.longitude;
    };
  };
}
