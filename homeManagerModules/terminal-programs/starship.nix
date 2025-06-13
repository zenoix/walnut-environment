{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf config.walnutHome.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = pkgs.lib.importTOML ../../nonNix/starship.toml;
    };
  };
}
