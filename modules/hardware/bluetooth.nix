{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    bluetooth.enable = lib.mkEnableOption "enable bluetooth and blueman";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      bluez
      bluez-tools
    ];
  };
}
