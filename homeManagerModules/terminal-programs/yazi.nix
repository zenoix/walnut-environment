{ lib, config, ... }:
{
  options = {
    walnutHome.yazi.enable = lib.mkEnableOption "enable yazi";
  };

  config = lib.mkIf config.walnutHome.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
