{ lib, config, ... }:
{
  options = {
    walnutHome.hyprpaper.enable = lib.mkEnableOption "enable hyprpaper";
  };

  config = lib.mkIf config.walnutHome.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ (builtins.toString ../../assets/finan-akbar-OhOun94xtF8-unsplash.jpg) ];
        wallpaper = [ ",${builtins.toString ../../assets/finan-akbar-OhOun94xtF8-unsplash.jpg}" ];
      };
    };
  };
}
