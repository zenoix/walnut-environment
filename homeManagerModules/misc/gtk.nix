{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.gtk-config.enable = lib.mkEnableOption "enable gtk config";
  };

  config = lib.mkIf config.walnutHome.gtk-config.enable {
    home.packages = with pkgs; [ pop-icon-theme ];
    gtk = {
      enable = true;
    };
  };
}
