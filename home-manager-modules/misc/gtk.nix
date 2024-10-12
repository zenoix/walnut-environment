{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.gtk-config.enable = lib.mkEnableOption "enable gtk config";
  };

  config = lib.mkIf config.walnut-home.gtk-config.enable {
    home.packages = with pkgs; [ pop-icon-theme ];
    gtk = {
      enable = true;
      iconTheme.name = "Pop";
    };
  };
}
