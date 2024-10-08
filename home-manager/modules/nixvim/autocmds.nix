{
  programs.nixvim = {

    autoGroups = {
      rel_number_toggle = {
        clear = true;
      };

      highlight_yank = { };

      filetype_indents = { };
    };

    autoCmd = [
      {
        event = "InsertEnter";
        group = "rel_number_toggle";
        desc = "Turn relative line numbers off in insert mode";
        callback = {
          __raw = ''
            function()
              vim.wo.relativenumber = false
            end
          '';
        };
      }

      {
        event = "InsertLeave";
        group = "rel_number_toggle";
        desc = "Turn relative line numbers on when leaving insert mode";
        callback = {
          __raw = ''
            function()
              vim.wo.relativenumber = true
            end
          '';
        };
      }

      {
        event = "TextYankPost";
        group = "highlight_yank";
        desc = "Highlight selection on yank";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
            end
          '';
        };
      }

      {
        event = "FileType";
        pattern = [ "nix" ];
        group = "filetype_indents";
        desc = "Set indent to 2 for given filetypes";
        callback = {
          __raw = ''
            function()
              vim.opt_local.shiftwidth = 2
              vim.opt_local.tabstop = 2
              vim.opt_local.softtabstop = 2;
              vim.opt_local.shiftwidth = 2;
            end
          '';
        };
      }
    ];
  };
}
