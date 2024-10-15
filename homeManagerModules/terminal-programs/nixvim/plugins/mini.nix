{
  programs.nixvim.plugins.mini = {
    enable = true;

    modules = {

      comment = {
        options = {
          custom_commentstring = {
            __raw = ''
                            function()
              				        return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
              			        end
            '';
          };
        };
      };

      move = {
        mappings = {
          # Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = "<S-h>";
          right = "<S-l>";
          down = "<S-j>";
          up = "<S-k>";

          # Move current line in Normal mode
          line_left = "";
          line_right = "";
          line_down = "";
          line_up = "";
        };
      };

      surround = { };

      pairs = { };

      ai = { };

    };
  };
}
