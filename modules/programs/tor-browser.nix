{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.tor-browser.enable = lib.mkEnableOption "enable tor browser";
  };

  config = lib.mkIf config.walnut.tor-browser.enable {
    environment.systemPackages = with pkgs; [ tor-browser-bundle-bin ];
  };
}
