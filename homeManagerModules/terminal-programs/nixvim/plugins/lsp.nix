{ pkgs-unstable, ... }:
{
  programs.nixvim.extraPlugins = with pkgs-unstable.vimPlugins; [ lsp_signature-nvim ];
  programs.nixvim.extraConfigLua = ''
    require('lsp_signature').setup({
      bind = true,
      hint_prefix = " ",
      handler_opts = {
        border = "rounded",
      },
      timer_interval = 100,
    })
  '';
  programs.nixvim.plugins = {
    lsp-format.enable = true;

    lsp-lines = {
      enable = true;
      package = pkgs-unstable.vimPlugins.lsp_lines-nvim;

      # NOTE: Currently doesn't work with ruff
      # luaConfig.post = "vim.diagnostic.config({ virtual_lines = { only_current_line = true } })";
    };

    lsp = {
      enable = true;
      package = pkgs-unstable.vimPlugins.nvim-lspconfig;
      inlayHints = true;
      keymaps = {
        silent = true;
        lspBuf = {
          K = "hover";
          "<leader>ca" = "code_action";
          "<leader>gd" = "definition";
          "<leader>gi" = "implementation";
          "<leader>gr" = "references";
          "<leader>rn" = "rename";
        };
      };

      onAttach = "require('lsp_signature').on_attach(signature_setup, bufnr)";

      postConfig = ''
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
      '';

      servers = {
        basedpyright = {
          enable = true;
          package = pkgs-unstable.basedpyright;
        };
        bashls = {
          enable = true;
          package = pkgs-unstable.bash-language-server;
        };
        dockerls.enable = true;
        golangci_lint_ls = {
          enable = true;
          filetypes = [
            "go"
            "gomod"
            "gowork"
            "gotmpl"
          ];
        };
        gopls.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        pylsp.enable = true;
        ruff = {
          enable = true;
          package = pkgs-unstable.ruff;
        };
        taplo.enable = true;
        typos_lsp = {
          enable = true;
          extraOptions.init_options.diagnosticSeverity = "Hint";
        };

      };
    };
  };
}
