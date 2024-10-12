{ lib, config, ... }:
{
  options = {
    walnut-home.syncthing.enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf config.walnut-home.syncthing.enable {

    services.syncthing = {
      enable = true;
    };
  };
}
