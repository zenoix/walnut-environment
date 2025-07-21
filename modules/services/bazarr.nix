{
  pkgs-unstable,
  lib,
  config,
  server,
  ...
}:
{
  options = {
    walnut.bazarr.enable = lib.mkEnableOption "enable bazarr";
  };

  config = lib.mkIf config.walnut.bazarr.enable {
    services.bazarr = {
      enable = true;
      openFirewall = true;
      package = pkgs-unstable.bazarr;
      user = server.user;
      group = "users";
    };
  };
}
