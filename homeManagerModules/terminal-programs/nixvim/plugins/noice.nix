{ pkgs, ... }:
{
  programs.nixvim.plugins.noice = {
    enable = true;
    package = pkgs.vimPlugins.noice-nvim;

    settings = {
      cmdline = {
        view = "cmdline";
      };

      lsp = {
        documentation.enabled = false;
        progress.enabled = false;
        signature.enabled = false;
        hover.enabled = false;
      };

      messages = {
        enabled = false;
      };

      notify = {
        enabled = false;
      };

      presets = {
        bottom_search = true;
        command_palette = true;
      };
    };
  };
}
