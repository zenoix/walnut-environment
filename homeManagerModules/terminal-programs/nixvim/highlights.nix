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

          # HACK: Temporary fix for fzf-lua's broken telescope highlights
          TelescopeSelection = {
            fg = "#f2cdcd";
            bold = true;
          };
          TelescopeBorder.fg = "#89b4fa";
          TelescopeMatching.fg = "#89b4fa";
          TelescopePreviewTitle.fg = "#a6e3a1";
          TelescopePromptNormal.fg = "#cdd6f4";
          TelescopePromptTitle.fg = "#f38ba8";
        };

      # HACK: Temporary fix for fzf-lua's broken telescope highlights
      extraConfigLuaPost = ''
        vim.api.nvim_set_hl(0, "TelescopeNormal", {})
      '';
    };
}
