{
  programs.nixvim = {
    highlight = {
      NonAscii = {
        underline = true;
        sp = "Red";
      };
    };

    autoGroups = {
      bad_chars = { };
    };

    autoCmd = [
      {
        event = [ "BufReadPost" ];
        group = "bad_chars";
        desc = "Add NonAscii highlight to non-ascii characters";
        pattern = [ "*" ];
        callback = {
          __raw = ''
            function()
              if vim.bo.filetype == "oil" then
                return
              end
              vim.cmd('match NonAscii "[^\\x00-\\x7F]"')
            end
          '';
        };
      }
    ];
  };
}
