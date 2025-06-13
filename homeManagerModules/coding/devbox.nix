{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.devbox.enable = lib.mkEnableOption "enable devbox";
  };

  config = lib.mkIf config.walnutHome.devbox.enable {

    home = {
      packages = with pkgs-unstable; [ devbox ];
    };

  };
}
