{
  programs.nixvim.plugins.mini = {
    enable = true;

    luaConfig.pre = ''
      local ai = require("mini.ai")
      local ext = require("mini.extra")
    '';

    mockDevIcons = true;

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
        n_lines = 500;
        custom_textobjects = {
          # code block
          o = {
            __raw = ''
              ai.gen_spec.treesitter({ 
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                      })'';
          };

          # function
          f = {
            __raw = ''ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" })'';
          };

          # class
          c = {
            __raw = ''ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" })'';
          };

          # tags
          t = {
            __raw = ''{ "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }'';
          };

          # digits
          d = {
            __raw = ''{ "%f[%d]%d+" }'';
          };

          # word with case
          e = {
            __raw = ''
              { 
                        { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
                        "^().*()$",
                      }'';
          };

          # u for "Usage"
          u = {
            __raw = ''ai.gen_spec.function_call()'';
          };

          # without dot in function name
          U = {
            __raw = ''ai.gen_spec.function_call({ name_pattern = "[%w_]" })'';
          };

          # indent level
          i = {
            __raw = ''ext.gen_ai_spec.indent()'';
          };

          # buffer
          g = {
            __raw = ''ext.gen_ai_spec.buffer()'';
          };
        };
      };

      cursorword = { };

      icons = { };

    };
  };
}
