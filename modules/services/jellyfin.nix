{
  pkgs,
  lib,
  config,
  server,
  ...
}:
{
  options = {
    walnut.jellyfin.enable = lib.mkEnableOption "enable jellyfin";
  };

  config = lib.mkIf config.walnut.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      user = server.user;
    };
    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];
  };
}
