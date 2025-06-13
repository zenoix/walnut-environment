{ lib, config, ... }:
{
  options = {
    walnutHome.sioyek.enable = lib.mkEnableOption "enable sioyek";
  };

  config = lib.mkIf config.walnutHome.sioyek.enable {
    programs.sioyek = {
      enable = true;
      bindings = {
        "move_up" = "k";
        "move_down" = "j";
        "move_left" = "h";
        "move_right" = "l";
        "screen_down" = [
          "d"
          "<C-d>"
        ];
        "screen_up" = [
          "u"
          "<C-u>"
        ];
      };
    };
  };
}
