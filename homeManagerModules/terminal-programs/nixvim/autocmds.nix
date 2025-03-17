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
        event = [
          "InsertEnter"
          "InsertLeave"
        ];
        desc = "Disable Treesitter for large files";
        callback = {
          __raw = ''
            function()
              if vim.api.nvim_buf_line_count(0) > 10000 then
                vim.cmd("TSToggle highlight")
              end
            end
          '';
        };
      }

      # The two following autocmds are from u/shivamrajput958
      {
        event = [
          "InsertEnter"
          "BufLeave"
          "FocusLost"
          "CmdlineEnter"
          "WinLeave"
        ];
        group = "rel_number_toggle";
        callback = {
          __raw = ''
            function()
              if vim.o.nu then
                vim.wo.relativenumber = false
                vim.wo.cursorline = false
                vim.cmd("redraw")
              end
            end
          '';
        };
      }

      {
        event = [
          "InsertLeave"
          "BufEnter"
          "FocusGained"
          "CmdlineLeave"
          "WinEnter"
        ];
        group = "rel_number_toggle";
        callback = {
          __raw = ''
            function()
              if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
                vim.wo.relativenumber = true
                vim.wo.cursorline = true
              end
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
        pattern = [
          "astro"
          "css"
          "cpp"
          "html"
          "js"
          "json"
          "nix"
          "sh"
        ];
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
