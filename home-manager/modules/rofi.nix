{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "\${pkgs.kitty}/bin/kitty";

    extraConfig = {
      show-icons = true;
      icon-theme = "Pop";
      modi = "drun,window,run";
    };
    theme =
      let
        inherit (config.lib.stylix) colors;
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      lib.mkForce {
        "*" = {
          font = "JetBrainsMono Nerd Font 10";
        };

        window = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = mkLiteral "false";
          width = mkLiteral "650px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";
          enabled = mkLiteral "true";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border-radius = mkLiteral "20px";
          border = mkLiteral "3px";
          border-color = mkLiteral "#${colors.base0E}";
          cursor = "default";
          background-color = mkLiteral "#${colors.base00}F7";
        };

        mainbox = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "30px";
          padding = mkLiteral "30px";
          background-color = mkLiteral "transparent";
          children = mkLiteral "[inputbar, message, listview]";
        };

        inputbar = {
          enabled = mkLiteral "true";
          border = mkLiteral "1px";
          border-radius = mkLiteral "100%";
          border-color = mkLiteral "#${colors.base02}";
          background-color = mkLiteral "#${colors.base02}";
          children = mkLiteral "[textbox-prompt-colon, entry, dummy, mode-switcher]";
        };

        textbox-prompt-colon = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          padding = mkLiteral "12px 15px";
          border-radius = mkLiteral "100%";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${colors.base0E}";
          str = " ";
          font = "JetBrainsMono Nerd Font 12";
        };

        entry = {
          enabled = mkLiteral "true";
          expand = mkLiteral "false";
          width = mkLiteral "200px";
          padding = mkLiteral "12px 16px";
          border-radius = mkLiteral "100%";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${colors.base05}";
          cursor = mkLiteral "text";
          placeholder = "Looking for something?";
          placeholder-color = mkLiteral "#${colors.base04}";
        };

        dummy = {
          expand = mkLiteral "true";
          background-color = mkLiteral "transparent";
        };

        listview = {
          enabled = mkLiteral "true";
          columns = mkLiteral "1";
          lines = mkLiteral "8";
          cycle = mkLiteral "true";
          dynamic = mkLiteral "true";
          scrollbar = mkLiteral "false";
          layout = mkLiteral "vertical";
          reverse = mkLiteral "false";
          fixed-height = mkLiteral "true";
          fixed-columns = mkLiteral "true";
          spacing = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          cursor = mkLiteral "default";
        };

        element = {
          enabled = mkLiteral "true";
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "7px";
          border = mkLiteral "0px";
          border-radius = mkLiteral "20%";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${colors.base05}";
          cursor = mkLiteral "pointer";
        };

        "element normal.normal" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "element normal.urgent" = {
          background-color = mkLiteral "#${colors.base02}";
          text-color = mkLiteral "#${colors.base08}";
        };
        "element normal.active" = {
          background-color = mkLiteral "#${colors.base02}";
          text-color = mkLiteral "#${colors.base0E}";
        };
        "element selected.normal" = {
          background-color = mkLiteral "#${colors.base02}";
          text-color = mkLiteral "#${colors.base05}";
        };
        "element selected.urgent" = {
          background-color = mkLiteral "#${colors.base02}";
          text-color = mkLiteral "#${colors.base08}";
        };
        "element selected.active" = {
          background-color = mkLiteral "#${colors.base02}";
          text-color = mkLiteral "#${colors.base0E}";
        };

        "element-icon" = {
          background-color = mkLiteral "transparent";
          size = mkLiteral "24px";
          cursor = mkLiteral "inherit";
        };

        "element-text" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "#${colors.base05}";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };

        "mode-switcher" = {
          enabled = mkLiteral "true";
          expand = mkLiteral "true";
          padding = mkLiteral "4px";
          text-color = mkLiteral "#${colors.base05}";
          background-color = mkLiteral "inherit";
        };

        button = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "#${colors.base05}";
          cursor = mkLiteral "pointer";
        };

        "button selected" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "#${colors.base0E}";
        };

        "error-message" = {
          padding = mkLiteral "20px";
          background-color = mkLiteral "#${colors.base00}";
          text-color = mkLiteral "#${colors.base08}";
        };

        message = {
          padding = mkLiteral "0px";
          background-color = mkLiteral "#${colors.base00}";
          text-color = mkLiteral "#${colors.base0E}";
        };

        textbox = {
          padding = mkLiteral "0px";
          border-radius = mkLiteral "0px";
          background-color = mkLiteral "#${colors.base00}";
          text-color = mkLiteral "#${colors.base0E}";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
      };
  };
}
