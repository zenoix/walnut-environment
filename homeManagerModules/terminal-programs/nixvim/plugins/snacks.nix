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

        statuscolumn = {
          enabled = false;
        };

        words = {
          enabled = false;
        };

      };

    };
  };
}
