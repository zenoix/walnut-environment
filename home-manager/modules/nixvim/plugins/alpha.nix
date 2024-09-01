{ pkgs, ... }: {
  programs.nixvim.plugins.alpha = {
    enable = true;

    layout = [
    { 
      type = "padding";
      val = 3;
    }
   #{
	 # 	type = "terminal";
	 # 	command = "kitty +kitten icat ~/walnut-environment/home-manager/modules/nixvim/static/spirited.gif";
	 # 	width = 70;
	 # 	height = 20;
	 # 	opts = {
	 # 		position = "center";
	 # 		redraw = true;
	 # 	};
	 # }
    {
      type = "text";
      val = [
        "       ▄▀▀▀▀▀▀▀▀▀▀▄▄           "
          "     ▄▀▀░░░░░░░░░░░░░▀▄        "
          "   ▄▀░░░░░░░░░░░░░░░░░░▀▄      "
          "   █░░░░░░░░░░░░░░░░░░░░░▀▄    "
          "  ▐▌░░░░░░░░▄▄▄▄▄▄▄░░░░░░░▐▌   "
          "  █░░░░░░░░░░░▄▄▄▄░░▀▀▀▀▀░░█   "
          " ▐▌░░░░░░░▀▀▀▀░░░░░▀▀▀▀▀░░░▐▌  "
          " █░░░░░░░░░▄▄▀▀▀▀▀░░░░▀▀▀▀▄░█  "
          " █░░░░░░░░░░░░░░░░▀░░░▐░░░░░▐▌ "
          " ▐▌░░░░░░░░░▐▀▀██▄░░░░░░▄▄▄░▐▌ "
          "  █░░░░░░░░░░░▀▀▀░░░░░░▀▀██░░█ "
          "  ▐▌░░░░▄░░░░░░░░░░░░░▌░░░░░░█ "
          "   ▐▌░░▐░░░░░░░░░░░░░░▀▄░░░░░█ "
          "    █░░░▌░░░░░░░░▐▀░░░░▄▀░░░▐▌ "
          "    ▐▌░░▀▄░░░░░░░░▀░▀░▀▀░░░▄▀  "
          "    ▐▌░░▐▀▄░░░░░░░░░░░░░░░░█   "
          "    ▐▌░░░▌░▀▄░░░░▀▀▀▀▀▀░░░█    "
          "    █░░░▀░░░░▀▄░░░░░░░░░░▄▀    "
          "   ▐▌░░░░░░░░░░▀▄░░░░░░▄▀      "
          "  ▄▀░░░▄▀░░░░░░░░▀▀▀▀█▀        "
          " ▀░░░▄▀░░░░░░░░░░▀░░░▀▀▀▀▄▄▄▄▄ "
          ];
      opts = {
        position = "center";
      };
    }
# { type = "padding";
# val = 1 };
# section.buttons;
# { type = "padding", val = 1 },
# section.footer,
# { type = "padding", val = 3 },
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
