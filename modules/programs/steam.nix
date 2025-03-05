{ lib, config, ... }:
{
  options = {
    walnut.steam.enable = lib.mkEnableOption "enable steam";
  };

  config = lib.mkIf config.walnut.steam.enable {
    programs.steam.enable = true;
  };
}
