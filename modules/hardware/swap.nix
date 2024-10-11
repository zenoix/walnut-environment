{ lib, config, ... }:
{
  options = {
    swap.enable = lib.mkEnableOption "enable swap";
  };

  config = lib.mkIf config.swap.enable {
    swapDevices = [
      {
        device = "/swapfile";
        size = 16 * 1024;
      }
    ];
  };
}
