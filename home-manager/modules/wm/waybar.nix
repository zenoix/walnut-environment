{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 18 -10 18";

        modules-left = [
          "hyprland/workspaces"
          # "hyprland/language"
          "tray"
          # "keyboard-state"
          # "hyprland/submap"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          # "custom/mem"
          # "cpu"
          "backlight"
          "battery"
        ];

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "active" = "󱨇";
            "default" = "";

          };
          "disable-scroll" = true;
          "rotate" = 0;
          "all-outputs" = true;
          "active-only" = false;
          "on-click" = "activate";
          persistent-workspaces = {
            "*" = 3;
          };
        };

        "hyprland/language" = {
          format-en = "EN";
          format-ja = "JP";
          min-length = 5;
          tooltip = false;
        };

        "keyboard-state" = {
          #numlock = true;
          capslock = true;
          format = "{icon} ";
          format-icons = {
            locked = " ";
            unlocked = "";
          };
        };

        "clock" = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a %d %b %I:%M %p}";
        };

        "pulseaudio" = {
          # scroll-step = 1; # %, can be a float
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = "{volume}%  {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = [ "" ];
          min-length = 7;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰂃"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰁹"
          ];
        };

        tray = {
          icon-size = 16;
          spacing = 5;
        };

      };
    };

    style =
      let
        inherit (config.lib.stylix) colors;
      in
      ''
        * {
            border: none;
            border-radius: 0;
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: JetBrains Mono;
            font-weight: bold; 
            min-height: 20px;
        }

        window#waybar {
            background: transparent;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        tooltip {
          border-radius: 8px;
          border-width: 0px;
        }

        #workspaces {
          margin-right: 8px;
          padding-left: 8px;
          padding-right: 8px;
          border-radius: 10px;
          transition: none;
          background: #${colors.base00};
        }

          #workspaces button {
              box-shadow: none;
              text-shadow: none;
              padding: 0px;
              border-radius: 8px;
              margin-top: 4px;
              margin-bottom: 4px;
              margin-left: 0px;
              padding-left: 4px;
              padding-right: 4px;
              margin-right: 0px;
              color: #${colors.base04};
              animation: ws_normal 20s ease-in-out 1;
          }

          #workspaces button.persistent{
              color: #${colors.base04};
          }

          #workspaces button.active {
              /* background: #2B2F38; */
              color: #${colors.base07};
              /* margin-left: 1px; 
              padding-left: 4px;
              padding-right: 8px;
              margin-right: 1px; */
              animation: ws_active 20s ease-in-out 1;
              /* transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682); */
          }

          #workspaces button:hover {
              /* background: @wb-hvr-bg; */
              color: #D5A5AA;
              animation: ws_hover 20s ease-in-out 1;
              transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
          }


                  #language {
                      padding-left: 12px;
                      padding-right: 12px;
                      border-radius: 10px;
                      transition: none;
                      color: #${colors.base05};
                      background: #${colors.base00};
                  }

                  #keyboard-state {
                      margin-right: 8px;
                      padding-right: 16px;
                      border-radius: 0px 10px 10px 0px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #custom-pacman {
                      padding-left: 16px;
                      padding-right: 8px;
                      border-radius: 10px 0px 0px 10px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #custom-mail {
                      margin-right: 8px;
                      padding-right: 16px;
                      border-radius: 0px 10px 10px 0px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #submap {
                      padding-left: 16px;
                      padding-right: 16px;
                      border-radius: 10px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #clock {
                      padding-left: 16px;
                      padding-right: 16px;
                      border-radius: 10px 10px 10px 10px;
                      transition: none;
                      color: #${colors.base05};
                      background: #${colors.base00};
                  }

                  #custom-weather {
                      padding-right: 16px;
                      border-radius: 0px 10px 10px 0px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #pulseaudio {
                      margin-left: 8px;
                      margin-right: 8px;
                      padding-left: 12px;
                      padding-right: 12px;
                      border-radius: 10px;
                      transition: none;
                      color: #${colors.base05};
                      background: #${colors.base00};
                  }

                  #pulseaudio.muted {
                      margin-left: 8px;
                      margin-right: 8px;
                      padding-left: 12px;
                      padding-right: 12px;
                  }

                  #custom-mem {
                      margin-right: 8px;
                      padding-left: 16px;
                      padding-right: 16px;
                      border-radius: 10px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #cpu {
                      margin-right: 8px;
                      padding-left: 16px;
                      padding-right: 16px;
                      border-radius: 10px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #temperature {
                      margin-right: 8px;
                      padding-left: 16px;
                      padding-right: 16px;
                      border-radius: 10px;
                      transition: none;
                      color: #ffffff;
                      background: #383c4a;
                  }

                  #temperature.critical {
                      background-color: #eb4d4b;
                  }

                  #backlight {
                      margin-right: 8px;
                      padding-left: 12px;
                      padding-right: 12px;
                      border-radius: 10px;
                      transition: none;
                      color: #${colors.base05};
                      background: #${colors.base00};
                  }

                  #battery {
                      padding-left: 16px;
                      padding-right: 16px;
                      border-radius: 10px;
                      transition: none;
                      color: #${colors.base05};
                      background: #${colors.base00};
                  }

                  #battery.charging {
                      color: #${colors.base00};
                      background-color: #${colors.base0B};
                  }

                  #battery.warning:not(.charging) {
                      background-color: #${colors.base0A};
                      color: black;
                  }

                  #battery.critical:not(.charging) {
                      background-color: #${colors.base08};
                      color: #ffffff;
                      animation-name: blink;
                      animation-duration: 0.5s;
                      animation-timing-function: linear;
                      animation-iteration-count: infinite;
                      animation-direction: alternate;
                  }

                  #tray {
                      padding-left: 16px;
                      padding-right: 16px;
                      border-radius: 10px;
                      transition: none;
                      color: #${colors.base05};
                      background: #${colors.base00};
                  }

                  @keyframes blink {
                      to {
                          background-color: #ffffff;
                          color: #000000;
                      }
                  }
      '';
  };
}
