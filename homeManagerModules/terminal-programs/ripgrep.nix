{ lib, config, ... }:
{
  options = {
    walnutHome.ripgrep.enable = lib.mkEnableOption "enable ripgrep";
  };

  config = lib.mkIf config.walnutHome.ripgrep.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}
