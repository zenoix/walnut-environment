{
  programs.nixvim.plugins.lualine = {
    enable = true;
    iconsEnabled = true;
    componentSeparators = {
      left = "|";
      right = "|";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
    disabledFiletypes = {
      statusline = [ ];
      winbar = [ ];
    };
    ignoreFocus = [ ];
    alwaysDivideMiddle = true;
    refresh = {
      statusline = 1000;
      tabline = 1000;
      winbar = 1000;
    };
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [
        "branch"
        "diff"
        "diagnostics"
      ];
      lualine_c = [ "filename" ];
      lualine_x = [
        "encoding"
        "fileformat"
        "filetype"
      ];
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
    inactiveSections = {
      lualine_a = [ ];
      lualine_b = [ ];
      lualine_c = [ "filename" ];
      lualine_x = [ "location" ];
      lualine_y = [ ];
      lualine_z = [ ];
    };
    tabline = { };
    winbar = { };
    inactiveWinbar = { };
    extensions = [ ];
  };
}
