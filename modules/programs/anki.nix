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
    environment.systemPackages = with pkgs; [
      anki-bin
      mpv
    ];
  };
}
