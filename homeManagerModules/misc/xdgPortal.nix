{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.xdgPortal.enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf config.walnutHome.xdgPortal.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };

  };
}
