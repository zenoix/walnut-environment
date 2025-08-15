{
  lib,
  config,
  ...
}:
{
  options = {
    walnut.catppuccin.enable = lib.mkEnableOption "enable catppuccin";
  };

  config = lib.mkIf config.walnut.catppuccin.enable {
    catppuccin = {
      enable = true;
      sddm.enable = !config.walnut.sddm.enable;
    };

  };
}
