{
  programs.nixvim.plugins.neogen = {
    enable = true;
    keymapsSilent = true;
    keymaps = {
      generate = "<leader>d";
    };

    settings = {
      enable_placeholders = true;
      snippet_engine = "luasnip";
      placeholder_hl = "DiagnosticHint";
      placeholders_text = {
        args = "[TODO:args]";
        attribute = "[TODO:attribute]";
        class = "[TODO:class]";
        description = "[TODO:description]";
        kwargs = "[TODO:kwargs]";
        parameter = "[TODO:parameter]";
        return = "[TODO:return]";
        throw = "[TODO:throw]";
        tparam = "[TODO:tparam]";
        type = "[TODO:type]";
        varargs = "[TODO:varargs]";
      };
    };
  };
}
