{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    firefox.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.firefox.enable { environment.systemPackages = with pkgs; [ firefox ]; };
}
