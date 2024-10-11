{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    xdg-portal.enable = lib.mkEnableOption "enable xdg portal";
  };

  config = lib.mkIf config.xdg-portal.enable {
    xdg.portal = {
      xdgOpenUsePortal = true;
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
