{
  lib,
  config,
  server,
  ...
}:
{
  options = {
    walnut.syncthing.enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf config.walnut.syncthing.enable {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = server.user;
      group = "users";
      dataDir = "/home/${server.user}/Documents";
      configDir = "/home/${server.user}/.config/syncthing";
      guiAddress = "0.0.0.0:8384";
    };
  };
}
