{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter-context = {
    enable = true;
    package = pkgs.vimPlugins.nvim-treesitter-context;
    settings = {
      max_lines = 3;
    };
  };
}
