{ lib, config, ... }:
{
  options = {
    xkb.enable = lib.mkEnableOption "enable xkb";
  };

  config = lib.mkIf config.xkb.enable {
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
