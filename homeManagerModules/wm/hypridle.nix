{ lib, config, ... }:
{
  options = {
    walnutHome.hypridle = {
      enable = lib.mkEnableOption "enable hypridle";
      dimScreen = {
        enable = lib.mkEnableOption "dim monitor after inactivity";
        delay = lib.mkOption {
          default = 180; # 3 minutes
          description = "delay to dim monitors in seconds";
          type = with lib.types; ints.positive;
        };
      };
    };
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
            if config.walnutHome.hypridle.dimScreen.enable then
              [
                {
                  timeout = config.walnutHome.hypridle.dimScreen.delay;
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
