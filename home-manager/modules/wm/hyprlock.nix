let
  textColor = "rgb(205, 214, 244)";
  inputTextColor = "rgb(186, 194, 222)";
  inputInnerColor = "rgb(49, 50, 68)";
  inputOuterColor = "rgb(147, 153, 178)";
  inputCheckColor = "rgb(148, 226, 213)";
  inputFailColor = "rgb(243, 139, 168)";
in
{
  programs.hyprlock = {
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
          font_color = inputTextColor;
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
          position = "0, 100";
          halign = "center";
          valign = "center";
        }

        # TIME
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
          color = textColor;
          font_size = 95;
          font_family = "JetBrains Mono Extrabold";
          position = "0, 110";
          halign = "center";
          valign = "center";
        }

        # Spotify
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(playerctl metadata --format ' {{artist}} - {{title}}')\"";
          color = textColor;
          font_size = 14;
          font_family = "JetBrains Mono";
          position = "0, 10";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}