{
  pkgs,
  personal,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.users.enable = lib.mkEnableOption "enable users";
  };

  config = lib.mkIf config.walnut.users.enable {
    users.users.${personal.user} = {
      isNormalUser = true;
      description = "${personal.user}";
      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
      ];
      # packages = with pkgs; [ ];
      shell = pkgs.zsh;
    };

    security.sudo.extraConfig = ''
      Defaults timestamp_timeout=30 # only ask for sudo password every 30 minutes
    '';
  };
}
