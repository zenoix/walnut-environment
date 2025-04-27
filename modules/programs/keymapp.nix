{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.keymapp.enable = lib.mkEnableOption "enable keymapp";
  };

  config = lib.mkIf config.walnut.keymapp.enable {
    environment.systemPackages = with pkgs; [ keymapp ];

    hardware.keyboard.zsa.enable = true;

  };
}
