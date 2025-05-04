{ lib, config, ... }:
{
  options = {
    walnut-home.sioyek.enable = lib.mkEnableOption "enable sioyek";
  };

  config = lib.mkIf config.walnut-home.sioyek.enable {
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
