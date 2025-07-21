{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.cloudflared.enable = lib.mkEnableOption "enable cloudflared";
  };

  config = lib.mkIf config.walnut.cloudflared.enable {
    environment.systemPackages = with pkgs-unstable; [ cloudflared ];
    services.cloudflared = {
      enable = true;

      tunnels = {
        "2fcc50eb-60d4-4755-ac46-77518e316c10" = {
          credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
          ingress = {
            "jellyfin.zenoix.com" = "http://localhost:8096";
            "jellyseerr.zenoix.com" = "http://localhost:5055";
            "prowlarr.zenoix.com" = "http://localhost:9696";
            "radarr.zenoix.com" = "http://localhost:7878";
            "sonarr.zenoix.com" = "http://localhost:8989";
            "bazarr.zenoix.com" = "http://localhost:6767";
          };
          default = "http_status:404";
        };

      };
    };
  };
}
