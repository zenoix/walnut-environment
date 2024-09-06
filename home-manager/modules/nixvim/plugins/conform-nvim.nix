{ lib, pkgs, pkgs-unstable, ... }: {
  programs.nixvim = {

    extraPackages = with pkgs; [
      beautysh
      goimports-reviser
      nodePackages.prettier
      stylua
      nixfmt-rfc-style

      pkgs-unstable.ruff
    ];

    plugins.conform-nvim = {
      enable = true;

      formattersByFt = {
        bash = [ "beautysh" ];
        go = [ "gofmt" "goimports-reviser" ];
        html = [ "prettier" ];
        javascript = [ "prettier" ];
        json = [ "prettier" ];
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
        yaml = [ "prettier" ];
        zsh = [ "beautysh" ];
      };

      formatOnSave = {
        lspFallback = true;
        timeoutMs = 500;
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
        mode = [ "n" "v" ];
      }
    ];
  };
}
