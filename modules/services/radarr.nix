{
  pkgs-unstable,
  lib,
  config,
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
      package = pkgs-unstable.radarr;
    };
  };
}
