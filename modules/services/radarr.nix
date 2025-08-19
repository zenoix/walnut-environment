{
  pkgs,
  lib,
  config,
  server,
  ...
}:
{
  options = {
    walnut.radarr.enable = lib.mkEnableOption "enable radarr";
  };

  config = lib.mkIf config.walnut.radarr.enable {
    services.radarr = {
      enable = true;
      openFirewall = true;
      package = pkgs.radarr;
      user = server.user;
      group = "users";
    };
  };
}
