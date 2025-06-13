{ lib, config, ... }:
{
  options = {
    walnutHome.syncthing.enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf config.walnutHome.syncthing.enable {

    services.syncthing = {
      enable = true;
    };
  };
}
