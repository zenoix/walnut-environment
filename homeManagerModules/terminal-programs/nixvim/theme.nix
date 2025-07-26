{ pkgs-unstable, ... }:
{
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      package = pkgs-unstable.vimPlugins.catppuccin-nvim;
      settings = {
        flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
        no_bold = false;
        no_italic = false;
        no_underline = false;
        transparent_background = true;
        show_end_of_buffer = true;
        integrations = {
          aerial = true;
          alpha = true;
          cmp = true;
          dashboard = true;
          dadbod_ui = true;
          dap = true;
          dap_ui = true;
          flash = true;
          fzf = true;
          gitgutter = true;
          gitsigns = true;
          harpoon = true;
          headlines = true;
          illuminate = true;
          indent_blankline = {
            enabled = true;
            scope_color = "mauve";
          };
          leap = true;
          lsp_trouble = true;
          mason = true;
          markdown = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          native_lsp = {
            enabled = true;
            underlines = {
              errors = [ "undercurl" ];
              hints = [ "undercurl" ];
              warnings = [ "undercurl" ];
              information = [ "undercurl" ];
              ok = [ "undercurl " ];
            };
            inlay_hints = {
              background = true;
            };
          };
          navic = {
            enabled = true;
            custom_bg = "lualine";
          };
          neotest = true;
          neotree = true;
          noice = true;
          notifier = true;
          notify = true;
          render_markdown = true;
          semantic_tokens = true;
          snacks = {
            enabled = true;
            indent_scope_color = "mauve";
          };
          telescope = {
            enabled = true;
            style = "nvchad";
          };
          treesitter = true;
          treesitter_context = true;
          which_key = true;
        };
      };
    };
  };
}
