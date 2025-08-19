{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      hadolint

      pkgs.mypy
    ];

    plugins.lint = {
      enable = true;

      lintersByFt = {
        dockerfile = [ "hadolint" ];
      };

      autoCmd = {
        callback = {
          __raw = ''
            function()
              require('lint').try_lint()
            end
          '';
        };
        event = [
          "BufEnter"
          "BufWritePost"
          "InsertLeave"
        ];
      };

    };

    keymaps = [
      {
        action = {
          __raw = ''
            function()
              require("lint").try_lint()
            end
          '';
        };
        key = "<leader>l";
      }
    ];
  };
}
