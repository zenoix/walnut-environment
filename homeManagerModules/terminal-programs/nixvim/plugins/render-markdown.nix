{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.render-markdown = {
      enable = true;
    };

    extraPackages = [ pkgs.python312Packages.pylatexenc ];
  };
}
