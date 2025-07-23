{ pkgs, pkgs-unstable, ... }:
{
  programs.nixvim = {

    extraPackages = with pkgs-unstable; [
      beautysh
      goimports-reviser
      nixfmt-rfc-style
      prettierd
      ruff
      stylua
    ];

    plugins.conform-nvim = {
      enable = true;

      settings = {
        formatters_by_ft = {
          astro = [ "prettierd" ];
          bash = [ "beautysh" ];
          css = [ "prettierd" ];
          cpp = [ "clang_format" ];
          go = [
            "gofmt"
            "goimports-reviser"
          ];
          html = [ "prettierd" ];
          javascript = [ "prettierd" ];
          json = [ "prettierd" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          python = [
            # To fix auto-fixable lint errors.
            "ruff_fix"
            # To run the Ruff formatter.
            "ruff_format"
            # To organize the imports.
            "ruff_organize_imports"
          ];
          tsx = [ "prettierd" ];
          typescript = [ "prettierd" ];
          yaml = [ "prettierd" ];
          zsh = [ "beautysh" ];
        };

        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
      };
    };

    keymaps = [
      {
        action = {
          __raw = ''
            function()
              require("conform").format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
              })
            end
          '';
        };
        key = "<leader>mp";
        mode = [
          "n"
          "v"
        ];
      }
    ];
  };
}
