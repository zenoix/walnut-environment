{ pkgs, ... }:
{
  programs.nixvim.plugins.todo-comments = {
    enable = true;
    package = pkgs.vimPlugins.todo-comments-nvim;
    settings = {
      highlight = {
        pattern = ".*<((KEYWORDS)%(\(.{-1,}\))?):";
      };
    };
  };
}
