{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    package = pkgs.vimPlugins.nvim-treesitter;
    settings = {
      highlight.enable = true;
      ensure_installed = [
        "vim"
        "vimdoc"
        "luadoc"
      ];
    };
  };
}
