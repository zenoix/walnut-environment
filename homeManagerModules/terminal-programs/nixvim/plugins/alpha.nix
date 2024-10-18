{ pkgs, ... }:
{
  programs.nixvim.plugins.alpha = {
    enable = true;

    layout = [
      {
        type = "padding";
        val = 4;
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
        val = 2;
      }
      {
        type = "group";
        val =
          let
            mkButton = shortcut: cmd: val: hl: {
              type = "button";
              inherit val;
              opts = {
                inherit hl shortcut;
                keymap = [
                  "n"
                  shortcut
                  cmd
                  { }
                ];
                position = "center";
                cursor = 0;
                width = 40;
                align_shortcut = "right";
                hl_shortcut = "string";
              };
            };
          in
          [
            (mkButton "n" "<CMD>enew<CR>" "  New file" "string")
            (mkButton "f" "<CMD>lua require('telescope.builtin').find_files()<CR>" "  Find File" "String")
            (mkButton "t" "<CMD>lua require('telescope.builtin').live_grep()<CR>" "󰊄  Find Text" "String")
            (mkButton "r" "<CMD>lua require('telescope.builtin').oldfiles()<CR>" "  Recent Files" "String")
            (mkButton "q" "<CMD>q<CR>" "󰅙  Quit Neovim" "String")
          ];
      }
      {
        type = "padding";
        val = 2;
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
        val = 4;
      }
    ];

    opts = {
      margin = 2;
      noautocmd = true;
      redraw_on_resize = true;
      setup.__raw = ''
          function()
          vim.api.nvim_create_autocmd("User", {
              pattern = "AlphaReady",
              desc = "hide cursor for alpha",
              callback = function()
              local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
              vim.api.nvim_set_hl(0, "Cursor", vim.tbl_extend("force", hl, { blend = 100 }))
              vim.opt.guicursor = "a:Cursor/lCursor"
              end,
              })
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            desc = "show cursor after alpha",
            callback = function()
            local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
            vim.api.nvim_set_hl(0, "Cursor", vim.tbl_extend("force", hl, { blend = nil }))
            vim.opt.guicursor = "n-v-c-sm-i-ci-ve-o:block,r-cr:hor20"
            end,
            })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            pattern = { "oil://*" },
            desc = "show cursor after alpha",
            callback = function()
            local hl = vim.api.nvim_get_hl(0, { name = "Cursor" })
            vim.api.nvim_set_hl(0, "Cursor", vim.tbl_extend("force", hl, { blend = nil }))
            vim.opt.guicursor = "n-v-c-sm-i-ci-ve-o:block,r-cr:hor20"
            end,
            })
        end
      '';
    };
  };
}
