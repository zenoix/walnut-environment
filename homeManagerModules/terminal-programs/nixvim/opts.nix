{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
    };

    opts = {
      # Make line numbers default
      number = true;

      # Set line numbers to be relative
      relativenumber = true;

      # Set cursor to block
      guicursor = "";

      # Highlight line that cursor is on
      cursorline = true;

      # Set highlight on search
      hlsearch = false;

      # Set incremental search
      incsearch = true;

      # Tabs
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;

      # Start scrolling 8 lines before the top/bottom
      scrolloff = 8;

      # Enable mouse mode only in normal mode
      mouse = "n";

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or capital in search
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Turn bell off
      belloff = "all";

      # Decrease update time
      updatetime = 100;
      timeout = true;
      timeoutlen = 500;

      # Set completeopt to have a better completion experience
      completeopt = [
        "menu"
        "menuone"
        "preview"
        "noselect"
      ];

      # NOTE: You should make sure your terminal supports this
      termguicolors = true;

      # Disable showmode as lualine shows the mode for you
      showmode = false;

    };
  };
}
