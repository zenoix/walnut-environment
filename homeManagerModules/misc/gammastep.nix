{
  personal,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.gammastep.enable = lib.mkEnableOption "enable gammastep config";
  };

  config = lib.mkIf config.walnutHome.gammastep.enable {
    services.gammastep = {
      enable = true;
      latitude = personal.latitude;
      longitude = personal.longitude;
    };
  };
}
