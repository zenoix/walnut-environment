{ lib, config, ... }:
{
  options = {
    walnut-home.yazi.enable = lib.mkEnableOption "enable yazi";
  };

  config = lib.mkIf config.walnut-home.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
