{ config, lib, ... }:
{
  programs.nixvim = {
    globals = {
      # Leader key
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps =
      let
        normal =
          lib.mapAttrsToList
            (key: action: {
              mode = "n";
              inherit action key;
            })
            {
              # Oil file navigator
              "<leader>pv" = "<CMD>Oil<CR>";
              "-" = "<CMD>Oil --float<CR>";

              # Keep cursor still when connecting lines to the end of previous lines
              "J" = "mzJ`z";

              # Keep cursor in the middle of screen when jumping around page
              "<C-d>" = "<C-d>zz";
              "<C-u>" = "<C-u>zz";

              # Keep cursor in the middle of screen when searching for text
              "n" = "nzzzv";
              "N" = "Nzzzv";

              # Use fzf-lua for code actions
              "<leader>ca" = "<CMD>FzfLua lsp_code_actions previewer=codeaction_native<CR>";
            };
        visual =
          lib.mapAttrsToList
            (key: action: {
              mode = "v";
              inherit action key;
            })
            {
              # Yank into computer clipboard
              "<leader>y" = "\"+y";

              # When pasting over something, keep the original thing in the clipboard
              "<leader>p" = "\"_dP";
            };
        normvis =
          lib.mapAttrsToList
            (key: action: {
              mode = [
                "n"
                "v"
              ];
              inherit action key;
            })
            {
              "<Space>" = "<Nop>";

              # Unmap s and S
              "s" = "<Nop>";
              "S" = "<Nop>";
            };
        terminal =
          lib.mapAttrsToList
            (key: action: {
              mode = "t";
              inherit action key;
            })
            {
              # Change terminal emulator normal mode key to esc
              "<leader><Esc>" = "<C-\\><C-n>";
            };
      in
      config.lib.nixvim.keymaps.mkKeymaps { options.silent = true; } (
        normal ++ visual ++ normvis ++ terminal
      );
  };
}
