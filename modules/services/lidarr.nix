{
  lib,
  config,
  server,
  ...
}:
{
  options = {
    walnut.lidarr.enable = lib.mkEnableOption "enable lidarr";
  };

  config = lib.mkIf config.walnut.lidarr.enable {
    services.lidarr = {
      enable = true;
      openFirewall = true;
      user = server.user;
    };
  };
}
