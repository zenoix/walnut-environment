{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.ruff.enable = lib.mkEnableOption "enable walnut-home.ruff";
  };

  config = lib.mkIf config.walnut-home.ruff.enable {
    programs.ruff = {
      enable = true;
      settings = pkgs.lib.importTOML ./ruff.toml;
    };
  };
}
