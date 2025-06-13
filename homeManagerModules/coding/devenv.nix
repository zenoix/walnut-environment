{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.devenv.enable = lib.mkEnableOption "enable devenv";
  };

  config = lib.mkIf config.walnutHome.devenv.enable {

    home = {
      packages = with pkgs-unstable; [ devenv ];
    };

  };
}
