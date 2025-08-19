{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.anki.enable = lib.mkEnableOption "enable anki";
  };

  config = lib.mkIf config.walnutHome.anki.enable {
    programs.anki = {
      enable = true;
      addons = [ ];
      language = "en_US";
      minimalistMode = true;
      sync.autoSync = true;
      theme = "dark";
    };
  };
}
