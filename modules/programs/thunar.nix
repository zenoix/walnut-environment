{ lib, config, ... }:
{
  options = {
    walnut.thunar.enable = lib.mkEnableOption "enable thunar";
  };

  config = lib.mkIf config.walnut.thunar.enable {
    programs.thunar.enable = true;
    services.gvfs.enable = true;
    services.tumbler.enable = true;
  };
}
