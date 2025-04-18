{ config, ... }:
{
  programs.nixvim =
    let
      subtext0 = "a6adc8";
    in
    {
      highlight = {
        LineNrAbove.fg = "#${subtext0}";
        LineNrBelow.fg = "#${subtext0}";
      };

      highlightOverride =
        let
          inherit (config.lib.stylix) colors;
        in
        {
          LineNr.fg = "#${subtext0}";
          CursorLineNr = {
            fg = "#${colors.base0E}";
            bold = true;
          };
        };
    };
}
