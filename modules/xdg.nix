{ pkgs, ... }:
{
  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
