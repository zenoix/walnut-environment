{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    shell-config.enable = lib.mkEnableOption "enable shell config";
  };

  config = lib.mkIf config.shell-config.enable {
    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
      fd
      htop
      killall
      tree
      unzip
      wget
      zip
    ];
  };
}
