{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.kitty.enable = lib.mkEnableOption "enable kitty";
  };

  config = lib.mkIf config.walnut.kitty.enable { environment.systemPackages = with pkgs; [ kitty ]; };
}
