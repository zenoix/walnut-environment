{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.appflowy.enable = lib.mkEnableOption "enable appflowy";
  };

  config = lib.mkIf config.walnutHome.appflowy.enable {
    home.packages = [ pkgs.appflowy ];
  };
}
