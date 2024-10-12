{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.walnut.hyprland.enable {
    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
      cliphist
      kitty
      wl-clipboard
      xdg-desktop-portal-gtk
      xwayland
      libnotify
    ];
  };
}
