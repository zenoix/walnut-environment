{ pkgs, ... }:
{
  programs.nixvim.plugins.gitgutter = {
    enable = true;
    package = pkgs.vimPlugins.gitgutter;
  };
}
