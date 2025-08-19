{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.jellyseerr.enable = lib.mkEnableOption "enable jellyseerr";
  };

  config = lib.mkIf config.walnut.jellyseerr.enable {
    services.jellyseerr = {
      enable = true;
      port = 5055;
      openFirewall = true;
      package = pkgs.jellyseerr;
    };
  };
}
