{
  lib,
  config,
  ...
}:
{
  options = {
    walnut.zsa.enable = lib.mkEnableOption "enable zsa";
  };

  config = lib.mkIf config.walnut.zsa.enable {
    hardware.keyboard.zsa.enable = true;
  };
}
