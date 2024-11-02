{ pkgs-unstable, ... }:
{
  programs.nixvim.plugins.gitgutter = {
    enable = true;
    package = pkgs-unstable.vimPlugins.gitgutter;
  };
}
