{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.nvim-biscuits ];
    extraConfigLua = ''require("nvim-biscuits").setup({ cursor_line_only = true })'';
  };

}
