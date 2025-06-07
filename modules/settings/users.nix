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
    # Decrypt zenoix password to /run/secrets-for-users/ so it can be used to create the user
    sops.secrets."user-passwords/zenoix".neededForUsers = true;
    users.mutableUsers = false; # Required for password to be set via sops during system activation

    users.users.${personal.user} = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."user-passwords/zenoix".path;
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
