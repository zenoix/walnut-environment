{ lib, config, ... }:
{
  options = {
    walnutHome.zoxide.enable = lib.mkEnableOption "enable zoxide";
  };

  config = lib.mkIf config.walnutHome.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
