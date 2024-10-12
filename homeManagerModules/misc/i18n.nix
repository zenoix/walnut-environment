{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.i18n.enable = lib.mkEnableOption "enable i18n";
  };

  config = lib.mkIf config.walnut-home.i18n.enable {
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
          fcitx5-configtool
        ];
      };
    };
  };
}