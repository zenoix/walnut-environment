{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = false;
    settings = {
      menu = {
        height = 20;
        width = 80;
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>h";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<leader>ph";
      action.__raw = ''
        function() 
          local hp = require'harpoon'
          hp.ui:toggle_quick_menu(hp:list())
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>1";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<leader>2";
      action.__raw = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<leader>3";
      action.__raw = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<leader>4";
      action.__raw = "function() require'harpoon':list():select(4) end";
    }
    {
      mode = "n";
      key = "<leader>5";
      action.__raw = "function() require'harpoon':list():select(5) end";
    }
    {
      mode = "n";
      key = "<leader>6";
      action.__raw = "function() require'harpoon':list():select(6) end";
    }
    {
      mode = "n";
      key = "<leader>7";
      action.__raw = "function() require'harpoon':list():select(7) end";
    }
    {
      mode = "n";
      key = "<leader>8";
      action.__raw = "function() require'harpoon':list():select(8) end";
    }
    {
      mode = "n";
      key = "<leader>9";
      action.__raw = "function() require'harpoon':list():select(9) end";
    }
  ];
}
