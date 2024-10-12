{ lib, config, ... }:
{
  options = {
    walnut.xkb.enable = lib.mkEnableOption "enable xkb";
  };

  config = lib.mkIf config.walnut.xkb.enable {
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
