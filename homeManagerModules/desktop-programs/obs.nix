{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.obs.enable = lib.mkEnableOption "enable obs";
  };

  config = lib.mkIf config.walnutHome.obs.enable {
    programs.obs-studio = {
      enable = true;
      package = pkgs-unstable.obs-studio;
    };
  };
}
