{
  pkgs,
  personal,
  lib,
  config,
  ...
}:
{
  options = {
    users.enable = lib.mkEnableOption "enable users";
  };

  config = lib.mkIf config.users.enable {
    users.users.${personal.user} = {
      isNormalUser = true;
      description = "${personal.user}";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      # packages = with pkgs; [ ];
      shell = pkgs.zsh;
    };
  };
}
