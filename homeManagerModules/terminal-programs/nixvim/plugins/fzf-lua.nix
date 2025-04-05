{ pkgs-unstable, ... }:
{
  programs.nixvim.plugins.fzf-lua = {
    enable = true;
    package = pkgs-unstable.vimPlugins.fzf-lua;
    profile = "telescope";
    settings = {
      winopts = {
        preview = {
          default = "bat";
        };
      };
    };

    keymaps = {
      "<leader>pf" = {
        action = "files";
      };
      "<leader>pb" = {
        action = "buffers";
      };
      "<leader>pd" = {
        action = "diagnostics_workspace";
      };
      "<leader>pg" = {
        action = "live_grep";
      };
    };
  };
}
