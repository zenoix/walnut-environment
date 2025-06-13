{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.i18n.enable = lib.mkEnableOption "enable i18n";
  };

  config = lib.mkIf config.walnutHome.i18n.enable {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-configtool
        ];
      };
    };
  };
}
