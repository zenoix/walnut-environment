{ lib, config, ... }:
{
  options = {
    walnut.docker.enable = lib.mkEnableOption "enable docker";
  };

  config = lib.mkIf config.walnut.docker.enable {
    virtualisation.docker = {
      enable = true;
    };
  };
}
