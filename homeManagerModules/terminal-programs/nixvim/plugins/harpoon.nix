{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymaps = {
      addFile = "<leader>h";
      toggleQuickMenu = "<leader>ph";
      navFile = {
        "1" = "<leader>1";
        "2" = "<leader>2";
        "3" = "<leader>3";
        "4" = "<leader>4";
        "5" = "<leader>5";
        "6" = "<leader>6";
        "7" = "<leader>7";
        "8" = "<leader>8";
        "9" = "<leader>9";
      };
    };
    menu = {
      height = 20;
      width = 80;
    };
  };
}
