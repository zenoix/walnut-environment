{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.obsidian.enable = lib.mkEnableOption "enable obsidian";
  };

  config = lib.mkIf config.walnut.obsidian.enable {
    environment.systemPackages = with pkgs; [ obsidian ];
  };
}
