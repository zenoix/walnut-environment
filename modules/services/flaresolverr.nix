{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.flaresolverr.enable = lib.mkEnableOption "enable flaresolverr";
  };

  config = lib.mkIf config.walnut.flaresolverr.enable {
    services.flaresolverr = {
      enable = true;
      openFirewall = true;
      package = pkgs.flaresolverr;
    };
  };
}
