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
          dap_ui = true;
          flash = true;
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
            };
          };
          navic = {
            enabled = true;
            custom_bg = "lualine";
          };
          neotest = true;
          neotree = true;
          noice = true;
          notify = true;
          semantic_tokens = true;
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
