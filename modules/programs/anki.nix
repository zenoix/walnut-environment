{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.anki.enable = lib.mkEnableOption "enable anki";
  };

  config = lib.mkIf config.walnut.anki.enable {
    programs.anki = {
      enable = true;
      addons = [ ];
      language = "ja_JP";
      minimalistMode = true;
      sync.autosync = true;
      theme = "dark";
    };
  };
}
