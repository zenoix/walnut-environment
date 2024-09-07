{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "render-markdown";
        src = pkgs.fetchFromGitHub {
          owner = "MeanderingProgrammer";
          repo = "render-markdown.nvim";
          rev = "2f9d4f0be8784ed4fef5960eb7b80bf60c5fdf56";
          hash = "sha256-VCGAkcUIynRTErcGlaMWd+uo2KN1f3suPpGEimAhWHM=";
        };
      })
    ];

    extraPackages = [ pkgs.python312Packages.pylatexenc ];
  };
}
