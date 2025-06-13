{ lib, config, ... }:
{
  options = {
    walnutHome.hypridle.enable = lib.mkEnableOption "enable hypridle";
  };

  config = lib.mkIf config.walnutHome.hypridle.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
          after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
        };

        listener =
          (
            # NOTE: This is very hacky, will find a more robust way another time
            if config.walnutHome.hyprland.monitor-setup != "double" then
              [
                {
                  timeout = 180; # 3min.
                  on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
                  on-resume = "brightnessctl -r"; # monitor backlight restore.
                }
              ]
            else
              [ ]
          )
          ++ [

            {
              timeout = 300; # 5min
              on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
            }
          ];
      };
    };
  };
}
