{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp-format.enable = true;

    lsp = {
      enable = true;
      package = pkgs.vimPlugins.nvim-lspconfig;
      inlayHints = true;
      keymaps = {
        silent = true;
        lspBuf = {
          K = "hover";
          "<leader>gd" = "definition";
          "<leader>gi" = "implementation";
          "<leader>gr" = "references";
          "<leader>rn" = "rename";
        };
      };

      postConfig = ''
        vim.diagnostic.config({ 
            signs = { 
                text = {
                    [vim.diagnostic.severity.ERROR] = " ", 
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " " 
                },
                texthl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError", 
                    [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                    [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo" 
                },

                numhl = {
                    [vim.diagnostic.severity.ERROR] = "", 
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "" 
                },
            },
            virtual_text = false, severity_sort = true 
        })
      '';

      servers = {
        basedpyright = {
          enable = true;
          package = pkgs.basedpyright;
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
          package = pkgs.bash-language-server;
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
          package = pkgs.nil;
        };
        ruff = {
          enable = true;
          package = pkgs.ruff;
        };
        taplo.enable = true;
        ts_ls = {
          enable = true;
          package = pkgs.typescript-language-server;
        };
        typos_lsp = {
          enable = true;
          extraOptions.init_options.diagnosticSeverity = "Hint";
        };

      };
    };
  };
}
