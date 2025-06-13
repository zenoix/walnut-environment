{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.ruff.enable = lib.mkEnableOption "enable walnutHome.ruff";
  };

  config = lib.mkIf config.walnutHome.ruff.enable {
    programs.ruff = {
      enable = true;
      package = pkgs-unstable.ruff;
      settings = pkgs.lib.importTOML ../../nonNix/ruff.toml;
    };
  };
}
