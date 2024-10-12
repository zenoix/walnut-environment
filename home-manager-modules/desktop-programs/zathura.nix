{ lib, config, ... }:
{
  options = {
    walnut-home.zathura.enable = lib.mkEnableOption "enable zathura";
  };

  config = lib.mkIf config.walnut-home.zathura.enable {
    programs.zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
        guioptions = "none";
        window-title-basename = true;
        recolor = true;
        recolor-keephue = true;
      };
    };
  };
}
