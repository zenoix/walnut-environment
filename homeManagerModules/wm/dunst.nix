{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.dunst.enable = lib.mkEnableOption "enable dunst";
  };

  config = lib.mkIf config.walnutHome.dunst.enable {
    home.packages = with pkgs; [ pop-icon-theme ];

    services.dunst = {
      enable = true;
      settings = {
        global = {
          corner_radius = 10;
          font = lib.mkForce "JetBrainsMono Nerd Font 10";
          frame_width = 2;
          gap_size = 10;
          height = 300;
          horizontal_padding = lib.mkForce 12;
          # icon_theme = "Pop,Adwaita,Papirus-Dark";
          icon_path = "${pkgs.pop-icon-theme}/share/icons/Pop/24x24/actions:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/animations:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/apps:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/categories:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/devices:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/emblems:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/emotes:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/mimetypes:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/panel:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/places:${pkgs.pop-icon-theme}/share/icons/Pop/24x24/status";
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
  };
}
