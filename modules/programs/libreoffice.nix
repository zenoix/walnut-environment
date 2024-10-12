{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.libreoffice.enable = lib.mkEnableOption "enable libreoffice";
  };

  config = lib.mkIf config.walnut.libreoffice.enable {
    environment.systemPackages = with pkgs; [ libreoffice-qt6-fresh ];
  };
}
