{ pkgs-unstable, ... }:
{
  programs.nixvim.plugins = {
    lsp-format.enable = true;

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

      postConfig = ''
        vim.diagnostic.config({ virtual_text = false, severity_sort = true })
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
          settings = {
            basedpyright = {
              analysis = {
                diagnosticSeverityOverrides = {
                  reportCallInDefaultInitializer = false;
                  reportMissingParameterType = false;
                  reportSelfClsParameterName = false;
                  reportUndefinedVariable = false;
                  reportUnknownParameterType = false;
                  reportUnusedExpression = false;
                  reportUnusedImport = false;
                  reportUnusedVariable = false;
                };
              };
            };
          };
        };
        bashls = {
          enable = true;
          package = pkgs-unstable.bash-language-server;
        };
        clangd.enable = true;
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
        nil_ls = {
          enable = true;
          package = pkgs-unstable.nil;
        };
        ruff = {
          enable = true;
          package = pkgs-unstable.ruff;
        };
        taplo.enable = true;
        ts_ls = {
          enable = true;
          package = pkgs-unstable.typescript-language-server;
        };
        typos_lsp = {
          enable = true;
          extraOptions.init_options.diagnosticSeverity = "Hint";
        };

      };
    };
  };
}
