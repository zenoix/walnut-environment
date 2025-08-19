{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.qbittorrent.enable = lib.mkEnableOption "enable qbittorrent";
  };

  config = lib.mkIf config.walnut.qbittorrent.enable {
    environment.systemPackages = [ pkgs.qbittorrent-enhanced-nox ];

    systemd = {
      packages = [ pkgs.qbittorrent-enhanced-nox ];
      services."qbittorrent-nox" = {
        overrideStrategy = "asDropin";
        wantedBy = [ "multi-user.target" ];
      };
    };
  };
}
