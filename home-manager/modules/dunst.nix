{ lib, config, ... }:
{
  services.dunst = {
    enable = true;
    settings =
      let
        inherit (config.lib.stylix) colors;
      in
      {
        global = {
          corner_radius = 10;
          font = lib.mkForce "JetBrainsMono 10";
          frame_color = "${colors.base0E}";
          frame_width = 2;
          gap_size = 10;
          height = 300;
          horizontal_padding = lib.mkForce 12;
          icon_theme = "Pop,Adwaita,Papirus-Dark";
          idle_threshold = 120;
          indicate_hidden = true;
          notification_limit = 5;
          offset = "30x30";
          origin = "top-right";
          padding = lib.mkForce 12;
          separator_color = lib.mkForce "frame";
          transparency = 0;
          width = 300;
        };

        urgence_low = {
          timeout = 10;
        };

        urgency_normal = {
          timeout = 10;
        };
      };
  };
}
