{ lib, config, ... }:
{
  options = {
    walnut-home.zoxide.enable = lib.mkEnableOption "enable zoxide";
  };

  config = lib.mkIf config.walnut-home.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
