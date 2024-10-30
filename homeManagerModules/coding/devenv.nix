{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.devenv.enable = lib.mkEnableOption "enable devenv";
  };

  config = lib.mkIf config.walnut-home.devenv.enable {

    home = {
      packages = with pkgs; [ devenv ];
    };

  };
}
