{ pkgs-unstable, ... }:
{
  programs.nixvim.plugins.todo-comments = {
    enable = true;
    package = pkgs-unstable.vimPlugins.todo-comments-nvim;
    highlight = {
      pattern = ".*<((KEYWORDS)%(\(.{-1,}\))?):";
    };
  };
}
