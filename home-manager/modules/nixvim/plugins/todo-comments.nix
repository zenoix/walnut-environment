{ pkgs-unstable, ... }:
{
  programs.nixvim.plugins.todo-comments = {
    enable = true;
    package = pkgs-unstable.vimPlugins.todo-comments-nvim;
    settings = {
      highlight = {
        pattern = ".*<((KEYWORDS)%(\(.{-1,}\))?):";
      };
    };
  };
}
