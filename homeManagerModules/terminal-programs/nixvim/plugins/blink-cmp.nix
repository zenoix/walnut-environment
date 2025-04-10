{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        completion = {
          accept = {
            auto_brackets.enabled = true;
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 100;
            window = {
              border = "rounded";
            };
          };
          ghost_text.enabled = true;
          list = {
            selection = {
              auto_insert = false;
              preselect = false;
            };
          };
          menu = {
            border = "rounded";
            draw = {
              align_to = "cursor";
              columns = {
                __raw = ''{ { "label", "label_description", gap = 1 }, {"kind_icon",gap = 1, "kind"} }'';
              };
              treesitter = [ "lsp" ];
            };

          };
          # TODO: trigger
        };

        keymap = {
          # TODO: Set keymaps
          preset = "enter";
        };

        signature = {
          enabled = true;
          window = {
            border = "rounded";
            show_documentation = true;
          };
        };

        snippets = {
          preset = "luasnip";
        };

        sources = {
          # TODO: Sources
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
      };
    };

    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };

    friendly-snippets.enable = true;

  };
}
