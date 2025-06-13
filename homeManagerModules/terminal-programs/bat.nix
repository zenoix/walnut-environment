{ lib, config, ... }:
{
  options = {
    walnutHome.bat.enable = lib.mkEnableOption "enable bat";
  };

  config = lib.mkIf config.walnutHome.bat.enable {
    programs.bat = {
      enable = true;
    };
  };
}
