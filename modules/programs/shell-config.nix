{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.shell-config.enable = lib.mkEnableOption "enable shell config";
  };

  config = lib.mkIf config.walnut.shell-config.enable {
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
