{ pkgs-unstable, ... }:
{
  programs.nixvim.plugins.treesitter-context = {
    enable = true;
    package = pkgs-unstable.vimPlugins.nvim-treesitter-context;
    settings = {
      max_lines = 3;
    };
  };
}
