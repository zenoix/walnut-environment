{ lib, config, ... }:
{
  options = {
    walnut-home.ripgrep.enable = lib.mkEnableOption "enable ripgrep";
  };

  config = lib.mkIf config.walnut-home.ripgrep.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}
