{ lib, config, ... }:
{
  options = {
    walnut-home.git-work.enable = lib.mkEnableOption "enable git for work";
  };

  config = lib.mkIf config.walnut-home.git-work.enable { };
}
