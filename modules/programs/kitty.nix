{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    kitty.enable = lib.mkEnableOption "enable kitty";
  };

  config = lib.mkIf config.kitty.enable { environment.systemPackages = with pkgs; [ kitty ]; };
}
