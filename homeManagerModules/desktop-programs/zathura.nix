{ lib, config, ... }:
{
  options = {
    walnutHome.zathura.enable = lib.mkEnableOption "enable zathura";
  };

  config = lib.mkIf config.walnutHome.zathura.enable {
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
