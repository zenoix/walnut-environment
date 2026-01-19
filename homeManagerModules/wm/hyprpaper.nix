{ lib, config, ... }:
{
  options = {
    walnutHome.hyprpaper.enable = lib.mkEnableOption "enable hyprpaper";
  };

  config = lib.mkIf config.walnutHome.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings =
        let
          wallpaperPath = (
            builtins.toString "${../../assets/finan-akbar-OhOun94xtF8-unsplash-catppuccin.jpg}"
          );
        in
        {
          wallpaper = [
            {
              monitor = "";
              path = wallpaperPath;
            }
          ];
        };
    };
  };
}
