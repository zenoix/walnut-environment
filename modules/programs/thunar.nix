{ lib, config, ... }:
{
  options = {
    thunar.enable = lib.mkEnableOption "enable thunar";
  };

  config = lib.mkIf config.thunar.enable {
    programs.thunar.enable = true;
    services.gvfs.enable = true;
    services.tumbler.enable = true;
  };
}
