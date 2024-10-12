{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf config.walnut-home.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = pkgs.lib.importTOML ./starship.toml;
    };
  };
}
