{ lib, config, ... }:
{
  options = {
    walnutHome.hyprlock.enable = lib.mkEnableOption "enable hyprlock";
  };

  config = lib.mkIf config.walnutHome.hyprlock.enable {
    programs.hyprlock =
      let
        textColor = "rgb(225, 225, 225)";
        inputInnerColor = "rgba(255, 255, 255, 0.1)";
        inputOuterColor = "rgba(255, 255, 255, 0)";
        inputCheckColor = "rgb(249, 226, 175)";
        inputFailColor = "rgb(243, 139, 168)";
      in
      {
        enable = true;
        settings = {
          general = {
            hide_cursor = false;
          };

          background = [
            {
              path = "$HOME/walnut-environment/assets/fuji.jpg";
              blur_passes = 2;
              brightness = 0.75;
              vibrancy = 0.2;
              vibrancy_darkness = 0.2;
            }
          ];

          input-field = [
            {
              size = "300, 60";
              monitor = "";
              outline_thickness = 2;
              dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
              dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
              dots_center = true;
              inner_color = inputInnerColor;
              outer_color = inputOuterColor;
              font_color = textColor;
              fade_on_empty = false;
              rounding = -1;
              check_color = inputCheckColor;
              placeholder_text = "<i><span foreground=\"##cdd6f4\">Input Password...</span></i>";
              fail_text = "<i>Incorrect Password</i>";
              fail_color = inputFailColor;
              hide_input = false;
              position = "0, -120";
              halign = "center";
              valign = "center";
              swap_font_color = false;
            }
          ];

          # DATE
          label = [
            {
              monitor = "";
              text = "cmd[update:1000] echo \"$(date +\"%A, %B %d\")\"";
              color = textColor;
              font_size = 22;
              font_family = "JetBrains Mono";
              position = "0, 50";
              halign = "center";
              valign = "center";
            }

            # TIME
            {
              monitor = "";
              text = "cmd[update:1000] echo \"$(date +\"%-H:%M\")\"";
              color = textColor;
              font_size = 95;
              font_family = "JetBrains Mono Extrabold";
              position = "0, 150";
              halign = "center";
              valign = "center";
            }

            # Spotify
            {
              monitor = "";
              text = "cmd[update:1000] echo \"$($HOME/walnut-environment/nonNix/scripts/now_playing.sh)\"";
              color = textColor;
              font_size = 14;
              font_family = "JetBrains Mono";
              position = "0, 10";
              halign = "center";
              valign = "bottom";
            }

            # # Battery
            # {
            #   monitor = "";
            #   text = "cmd[update:1000] echo \"$($HOME/walnut-environment/nonNix/scripts/battery.sh)\"";
            #   color = textColor;
            #   font_size = 12;
            #   font_family = "JetBrains Mono";
            #   position = "-15, 415";
            #   halign = "right";
            #   valign = "center";
            # }
          ];
        };
      };
  };
}
