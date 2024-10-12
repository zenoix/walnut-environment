{ lib, config, ... }:
{
  options = {
    walnut.grub.enable = lib.mkEnableOption "enable grub";
  };

  config = lib.mkIf config.walnut.grub.enable {
    boot.loader.systemd-boot.enable = false;
    boot.loader.grub = {
      enable = true;
      device = "nodev";
      copyKernels = true;
      useOSProber = true;
      efiSupport = true;
    };
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot";
  };
}
