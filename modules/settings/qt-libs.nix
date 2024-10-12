{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    qt-libs.enable = lib.mkEnableOption "enable qt libs";
  };

  config = lib.mkIf config.qt-libs.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugin-kvantum
    ];
  };
}
