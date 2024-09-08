{
  programs.nixvim.plugins.neogen = {
    enable = true;
    enablePlaceholders = true;
    keymapsSilent = true;
    placeholderHighlight = "DiagnosticHint";
    snippetEngine = "luasnip";
    keymaps = {
      generate = "<leader>d";
    };

    placeholdersText = {
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
}
