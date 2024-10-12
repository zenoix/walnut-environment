{ lib, config, ... }:
{
  options = {
    walnut-home.bat.enable = lib.mkEnableOption "enable bat";
  };

  config = lib.mkIf config.walnut-home.bat.enable {
    programs.bat = {
      enable = true;
    };
  };
}
