{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.devbox.enable = lib.mkEnableOption "enable devbox";
  };

  config = lib.mkIf config.walnut-home.devbox.enable {

    home = {
      packages = with pkgs-unstable; [ devbox ];
    };

  };
}
