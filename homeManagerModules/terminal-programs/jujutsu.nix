{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.jujutsu.enable = lib.mkEnableOption "enable jujutsu";
  };

  config = lib.mkIf config.walnutHome.jujutsu.enable {
    programs.jujutsu = {
      enable = true;
      package = pkgs-unstable.jujutsu;
    };
  };
}
