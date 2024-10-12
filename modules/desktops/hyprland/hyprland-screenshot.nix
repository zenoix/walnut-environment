{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    hyprland.screenshot.enable = lib.mkEnableOption "enable screenshotting in hyprland";
  };

  config = lib.mkIf config.hyprland.screenshot.enable {

    environment.systemPackages = with pkgs; [
      grim
      grimblast
      slurp
      swappy
    ];
  };
}
