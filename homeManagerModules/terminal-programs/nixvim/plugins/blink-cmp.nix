{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        completion = {
          accept = {
            auto_brackets.enabled = true;
          };
          list = {
            selection = {
              auto_insert = false;
              preselect = false;
            };
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
            # TODO: window
          };
          # TODO: menu
          # TODO: trigger
        };

        keymap = {
          # TODO: Set keymaps
          preset = "enter";
        };

        signature = {
          enabled = true;
          # TODO: window
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

    friendly-snippets.enable = true;

  };
}
