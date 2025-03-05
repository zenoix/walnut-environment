{
  programs.nixvim.plugins.mini = {
    enable = true;

    luaConfig.pre = ''
      local ai = require("mini.ai")
      local ext = require("mini.extra")
    '';

    modules = {

      extra = { };

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

      ai = {
        custom_textobjects = {
          s = {
            __raw = ''
              ai.gen_spec.treesitter({
                  a = {"@block.outer", "@conditional.outer"},
                  i = {"@block.inner", "@conditional.inner"},
                  })
            '';
          };
          f = {
            __raw = ''ai.gen_spec.treesitter({a = "@function.outer", i = "@function.inner" })'';
          };
          i = {
            __raw = ''ext.gen_ai_spec.indent()'';
          };
          g = {
            __raw = ''ext.gen_ai_spec.buffer()'';
          };
        };
      };

      cursorword = { };

    };
  };
}
