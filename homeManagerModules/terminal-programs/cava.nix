{ lib, config, ... }:
{
  options = {
    walnutHome.cava.enable = lib.mkEnableOption "enable cava";
  };

  config = lib.mkIf config.walnutHome.cava.enable {
    programs.cava = {
      enable = true;
    };
  };
}
