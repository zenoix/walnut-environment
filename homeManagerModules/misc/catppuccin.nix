{
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.catppuccin.enable = lib.mkEnableOption "enable catppuccin config";
  };

  config = lib.mkIf config.walnutHome.catppuccin.enable {
    catppuccin = {
      enable = true;

      firefox = {
        force = true;
      };
      hyprlock.enable = !config.walnutHome.hyprlock.enable;
    };
  };
}
