{ lib, config, ... }:
{
  options = {
    walnutHome.git-work.enable = lib.mkEnableOption "enable git for work";
  };

  config = lib.mkIf config.walnutHome.git-work.enable { };
}
