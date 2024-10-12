{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.xdg-portal.enable = lib.mkEnableOption "enable xdg portal";
  };

  config = lib.mkIf config.walnut.xdg-portal.enable {
    xdg.portal = {
      xdgOpenUsePortal = true;
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
