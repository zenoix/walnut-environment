{ lib, config, ... }:
{

  options = {
    walnut.networking.enable = lib.mkEnableOption "enable networking";
  };

  config = lib.mkIf config.walnut.networking.enable {
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking = {
      networkmanager.enable = true;
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
        "2606:4700:4700::1111"
        "2606:4700:4700::1001"
      ];
    };
  };
}
