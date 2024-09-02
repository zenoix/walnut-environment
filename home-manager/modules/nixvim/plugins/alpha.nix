{ pkgs, ... }: {
  programs.nixvim.plugins.alpha = {
    enable = true;

    layout = [
      { 
        type = "padding";
        val = 3;
      }
      {
        type = "text";
        val = [
          "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⡋⠉⠙⠒⢤⡀⠀⠀⠀⠀⠀⢠⠖⠉⠉⠙⠢⡄⠀"
          "⠀⠀⠀⠀⠀⠀⢀⣼⣟⡒⠒⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠹⡄"
          "⠀⠀⠀⠀⠀⠀⣼⠷⠖⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⢷"
          "⠀⠀⠀⠀⠀⠀⣷⡒⠀⠀⢐⣒⣒⡒⠀⣐⣒⣒⣧⠀⠀⡇⠀⢠⢤⢠⡠⠀⠀⢸"
          "⠀⠀⠀⠀⠀⢰⣛⣟⣂⠀⠘⠤⠬⠃⠰⠑⠥⠊⣿⠀⢴⠃⠀⠘⠚⠘⠑⠐⠀⢸"
          "⠀⠀⠀⠀⠀⢸⣿⡿⠤⠀⠀⠀⠀⠀⢀⡆⠀⠀⣿⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⣸"
          "⠀⠀⠀⠀⠀⠈⠿⣯⡭⠀⠀⠀⠀⢀⣀⠀⠀⠀⡟⠀⠀⢸⠀⠀⠀⠀⠀⠀⢠⠏"
          "⠀⠀⠀⠀⠀⠀⠀⠈⢯⡥⠄⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀⠀⠳⢄⣀⣀⣀⡴⠃⠀"
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡦⣄⣀⣀⣀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀"
          "⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⠛⠃⠀⠀⠀⢹⠳⡶⣤⡤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀"
          "⠀⠀⠀⠀⣠⢴⣿⣿⣿⡟⡷⢄⣀⣀⣀⡼⠳⡹⣿⣷⠞⣳⠀⠀⠀⠀⠀⠀⠀⠀"
          "⠀⠀⠀⢰⡯⠭⠹⡟⠿⠧⠷⣄⣀⣟⠛⣦⠔⠋⠛⠛⠋⠙⡆⠀⠀⠀⠀⠀⠀⠀"
          "⠀⠀⢸⣿⠭⠉⠀⢠⣤⠀⠀⠀⠘⡷⣵⢻⠀⠀⠀⠀⣼⠀⣇⠀⠀⠀⠀⠀⠀⠀"
          "⠀⠀⡇⣿⠍⠁⠀⢸⣗⠂⠀⠀⠀⣧⣿⣼⠀⠀⠀⠀⣯⠀⢸⠀⠀⠀⠀⠀⠀⠀"
          #"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⡄⠀⠀⠀⠀⠀⠀⠀⣠⣄⠀⠀⠀⠀⠀"
          #"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡇⠀⠀⠀⠀⠀⠀⢰⣿⣿⡄⠀⠀⠀⠀"
          #"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀"
          #"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⣿⣿⣯⣤⣤⣤⣀⣀⣸⣿⣿⣿⡇⠀⠀⠀⠀"
          #"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀"
          #"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡏⢠⡦⠈⣿⣿⣿⣿⣿⣿⠟⠛⢻⣷⡄⠀⠀⠀⠀"
          #"⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣦⣤⣾⣿⣿⣿⣿⣿⣿⠀⠿⢀⣿⣷⠄⠀⠀⠀"
          #"⢠⣄⠀⠀⠀⣼⣿⡆⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⡇⠀⠀⠀"
          #"⢸⣿⣷⣄⢀⣿⣿⣿⠀⠀⠀⢀⣿⣿⣿⠿⠋⠉⠁⠀⠀⠈⠉⠉⠻⢿⣿⣿⣿⣿⣿⣷⠀⠀⠀"
          #"⠀⣿⣿⠿⣿⣿⡿⣛⢷⠀⠀⢸⣿⣿⠏⢀⣤⣄⠀⣠⣤⡄⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣦⣄⠀"
          #"⠀⣿⣇⣀⣽⣿⣷⣤⣾⣧⠀⠘⣿⠏⠀⠛⠋⠙⠀⠛⠙⠛⠀⠾⠿⣷⢸⣿⣿⣿⣿⣿⣿⣿⡇"
          #"⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡿⣿⣿⣿⣿⣿⡇"
          #"⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡿⠁"
          #"⠀⢻⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡿⠋⠀⠀"
          #"⠀⠀⠉⠛⠛⠛⠛⠛⠛⠁⠀⠀⠀⠀⠀⠘⠻⢲⠦⠤⠤⠀⠀⠀⠀⣤⢴⡿⠟⠁⠀⠀⠀⠀⠀"
        ];
        opts = {
          position = "center";
          hl = "keyword";
        };
      }
      {
        type = "padding";
        val = 1;
      }
      {
        type = "group";
        val = [
          {
            on_press = {
              __raw = "function() vim.cmd[[ene]] end";
            };
            opts = {
              shortcut = "n";
            };
            type = "button";
            val = "  New file";
          }
          {
            on_press = {
              __raw = "function() vim.cmd[[Telescope find_files]] end";
            };
            opts = {
              shortcut = "f";
            };
            type = "button";
            val = "  Find File   ";
          }
          {
            on_press = {
              __raw = "function() vim.cmd[[Telescope live_grep]] end";
            };
            opts = {
              shortcut = "t";
            };
            type = "button";
            val = "󰊄  Find Text   ";
          }
          {
            on_press = {
              __raw = "function() vim.cmd[[Telescope oldfiles]] end";
            };
            opts = {
              shortcut = "r";
            };
            type = "button";
            val = "  Recent Files";
          }{
            on_press = {
              __raw = "function() vim.cmd[[Telescope find_files search_dirs={'~/walnut-environment'}]] end";
            };
            opts = {
              shortcut = "c";
            };
            type = "button";
            val = "  Nvim Config ";
          }
          {
            on_press = {
              __raw = "function() vim.cmd[[q]] end";
            };
            opts = {
              shortcut = "q";
            };
            type = "button";
            val = "󰅙 Quit Neovim";
          }
        ];
        opts = {
          position = "center";
        };
      }
      { 
        type = "padding";
        val = 1;
      }
      {
        type = "text";
        val = [
  			  "                                  "
  			  "Everything not saved will be lost."
  			  "                                  "
        ];
        opts = {
          position = "center";
          hl = "number";
        };
      }
      {
        type = "padding";
        val = 3;
      }
    ];

    opts = {
      margin = 2;
      noautocmd = true;
      redraw_on_resize = true;
      #setup.__raw = ''
      #  function()
      #  vim.api.nvim_create_autocmd("User", {
      #      pattern = "AlphaReady",
      #      desc = "hide cursor for alpha",
      #      callback = function()
      #      local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
      #      vim.api.nvim_set_hl(0, "Cursor", vim.tbl_extend("force", hl, { blend = 100 }))
      #      vim.opt.guicursor = "a:Cursor/lCursor"
      #      end,
      #      })
      #vim.api.nvim_create_autocmd("BufUnload", {
      #    buffer = 0,
      #    desc = "show cursor after alpha",
      #    callback = function()
      #    local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
      #    vim.api.nvim_set_hl(0, "Cursor", vim.tbl_extend("force", hl, { blend = nil }))
      #    vim.opt.guicursor = "n-v-c-sm-i-ci-ve-o:block,r-cr:hor20"
      #    end,
      #    })
      #vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      #    pattern = { "oil://*" },
      #    desc = "show cursor after alpha",
      #    callback = function()
      #    local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
      #    vim.api.nvim_set_hl(0, "Cursor", vim.tbl_extend("force", hl, { blend = nil }))
      #    vim.opt.guicursor = "n-v-c-sm-i-ci-ve-o:block,r-cr:hor20"
      #    end,
      #    })
      #end
      #  '';
    };
  };
}
