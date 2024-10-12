{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.firefox.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.walnut.firefox.enable {
    environment.systemPackages = with pkgs; [ firefox ];
  };
}
