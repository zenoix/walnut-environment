{ pkgs-unstable, ... }:
{
  programs.fastfetch = {
    enable = true;
    package = pkgs-unstable.fastfetch;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = ../../assets/kaoru_waguri.jpg;
        type = "kitty";
        height = 15;
        padding = {
          top = 1;
          left = 2;
        };
      };
      display = {
        separator = " ";
      };
      modules = [
        # "break"
        # "break"
        # "break"
        # {
        #   type = "custom";
        #   format = "\u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m";
        # }
        "break"
        {
          type = "title";
          keyWidth = 10;
        }
        "break"
        {
          type = "os";
          key = " ";
          keyColor = "34"; # = color4
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "34";
        }
        {
          type = "packages";
          format = "{} (nixpkgs)";
          key = "󰏖 ";
          keyColor = "34";
        }
        {
          type = "shell";
          key = " ";
          keyColor = "34";
        }
        {
          type = "terminal";
          key = " ";
          keyColor = "34";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "34";
        }
        {
          type = "cursor";
          key = "󰇀 ";
          keyColor = "34";
        }
        {
          type = "terminalfont";
          key = " ";
          keyColor = "34";
        }
        {
          type = "uptime";
          key = " ";
          keyColor = "34";
        }
        {
          type = "datetime";
          format = "{1}-{3}-{11}";
          key = " ";
          keyColor = "34";
        }
        {
          type = "media";
          key = "󰝚 ";
          keyColor = "34";
        }
        {
          type = "player";
          key = " ";
          keyColor = "34";
        }
        "break"
        # {
        #   type = "custom";
        #   format = "\u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m";
        # }
        "Colors"
        "break"
        # "break"
      ];
    };
  };
}