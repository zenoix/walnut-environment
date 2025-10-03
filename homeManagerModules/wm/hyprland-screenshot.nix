{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.hyprland.screenshot.enable = lib.mkEnableOption "enable screenshotting in hyprland";
  };

  config = lib.mkIf config.walnutHome.hyprland.screenshot.enable {

    home.packages = with pkgs; [
      grim
      grimblast
      slurp
      swappy
    ];

    wayland.windowManager.hyprland.settings.bind = [
      "$mainMod SHIFT, P, exec, grim -g \"$(slurp)\" - | swappy -f -"
    ];
  };
}
