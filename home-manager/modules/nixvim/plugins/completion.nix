{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        preselect = "cmp.PreselectMode.None";

        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        # TODO: Add border
        # window = {
        #   completion.border = []
        # }

        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
            				["<C-b>"] = cmp.mapping.scroll_docs(-4),
            				["<C-f>"] = cmp.mapping.scroll_docs(4),
            				["<C-Space>"] = cmp.mapping.complete(),
            				["<C-e>"] = cmp.mapping.abort(),
            				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            				["<Tab>"] = cmp.mapping(function(fallback)
            					if cmp.visible() then
            						cmp.select_next_item()
            					elseif require("luasnip").locally_jumpable(1) then
            						require("luasnip").jump(1)
            					else
            						fallback()
            					end
            				end, { "i", "s" }),
            				["<S-Tab>"] = cmp.mapping(function(fallback)
            					if cmp.visible() then
            						cmp.select_prev_item()
            					elseif require("luasnip").locally_jumpable(-1) then
            						luasnip.jump(-1)
            					else
            						fallback()
            					end
            				end, { "i", "s" }),
            			})
          '';
        };
      };

      filetype = {
        sql = {
          sources = [
            { name = "vim-dadbod-completion"; }
            { name = "buffer"; }
          ];
        };
      };

      cmdline = {
        "/" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            { name = "path"; }
            {
              name = "cmdline";
              option = {
                ignore_cmds = [
                  "Man"
                  "!"
                ];
              };
            }
          ];
        };
      };
    };

    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };

    lspkind = {
      enable = true;
    };
  };
}
