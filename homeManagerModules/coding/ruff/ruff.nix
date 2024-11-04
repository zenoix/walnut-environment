{
  pkgs,
  pkgs-unstable,
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
      package = pkgs-unstable.ruff;
      settings = pkgs.lib.importTOML ./ruff.toml;
    };
  };
}
