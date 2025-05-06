{
  lib,
  config,
  ...
}:
{
  options = {
    walnut.zsa.enable = lib.mkEnableOption {
      default = config.walnut.zsa.enable;
      description = "enable zsa";
    };
  };

  config = lib.mkIf config.walnut.zsa.enable {
    hardware.keyboard.zsa.enable = true;
  };
}
