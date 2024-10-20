{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "render-markdown";
        src = pkgs.fetchFromGitHub {
          owner = "MeanderingProgrammer";
          repo = "render-markdown.nvim";
          rev = "e1a2289106a9ce5ea1b20b78c90aef4d890950b7";
          hash = "sha256-9ash/ev12Elee2YIRiX5KCCR55jN+DA2dshQ7Uwjrpc=";
        };
      })
    ];

    extraPackages = [ pkgs.python312Packages.pylatexenc ];
  };
}
