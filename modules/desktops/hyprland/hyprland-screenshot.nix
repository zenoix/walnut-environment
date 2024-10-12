{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.hyprland.screenshot.enable = lib.mkEnableOption "enable screenshotting in hyprland";
  };

  config = lib.mkIf config.walnut.hyprland.screenshot.enable {

    environment.systemPackages = with pkgs; [
      grim
      grimblast
      slurp
      swappy
    ];
  };
}
