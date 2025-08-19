{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.prowlarr.enable = lib.mkEnableOption "enable prowlarr";
  };

  config = lib.mkIf config.walnut.prowlarr.enable {
    services.prowlarr = {
      enable = true;
      openFirewall = true;
      package = pkgs.prowlarr;
    };
  };
}
