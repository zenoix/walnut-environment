{ pkgs-unstable, ... }:
{
  programs.nixvim.plugins = {
    lsp-format.enable = true;

    lsp-lines.enable = true;

    lsp = {
      enable = true;
      # TODO: Not enabled in 24.05
      # inlayHints = true;
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
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
      '';

      servers = {
        bashls.enable = true;
        dockerls.enable = true;
        golangci-lint-ls = {
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
        pylsp.enable = true;
        ruff.enable = true;
        taplo.enable = true;
        typos-lsp = {
          enable = true;
          extraOptions.init_options.diagnosticSeverity = "Hint";
        };

      };
    };
  };
}
