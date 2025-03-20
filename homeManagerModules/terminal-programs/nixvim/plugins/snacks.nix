{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.snacks = {
      enable = true;

      settings = {
        bigfile = {
          enabled = false;
        };

        notifier = {
          enabled = true;
          style = "fancy";
        };

        quickfile = {
          enabled = true;
        };

        rename.enable = true;

        statuscolumn = {
          enabled = false;
        };

        words = {
          enabled = false;
        };

      };

    };

    autoCmd = [
      {
        event = "User";
        pattern = "OilActionsPost";
        desc = "Rename moved files in Oil";
        callback = {
          __raw = ''
            function(event)
              if event.data.actions.type == "move" then
                Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
              end
            end
          '';
        };
      }
    ];
  };
}
