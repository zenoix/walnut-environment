{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.gimp.enable = lib.mkEnableOption "enable gimp";
  };

  config = lib.mkIf config.walnutHome.gimp.enable {
    home.packages = [ pkgs.gimp ];
  };
}
