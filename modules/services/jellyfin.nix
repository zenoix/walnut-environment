{
  pkgs,
  lib,
  config,
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
    };
    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];
  };
}
