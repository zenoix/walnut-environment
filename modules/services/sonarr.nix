{
  pkgs-unstable,
  lib,
  config,
  server,
  ...
}:
{
  options = {
    walnut.sonarr.enable = lib.mkEnableOption "enable sonarr";
  };

  config = lib.mkIf config.walnut.sonarr.enable {
    services.sonarr = {
      enable = true;
      openFirewall = true;
      package = pkgs-unstable.sonarr;
      user = server.user;
      group = "users";
    };
  };
}
