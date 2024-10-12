{ lib, config, ... }:
{
  options = {
    walnut.swap.enable = lib.mkEnableOption "enable swap";
  };

  config = lib.mkIf config.walnut.swap.enable {
    swapDevices = [
      {
        device = "/swapfile";
        size = 16 * 1024;
      }
    ];
  };
}
