{ lib, config, ... }:
{
  options = {
    walnutHome.waybar.enable = lib.mkEnableOption "enable waybar";
    walnutHome.waybar.group2.enable = lib.mkOption {
      default = true;
      type = with lib.types; nullOr (bool);
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.walnutHome.waybar.enable {
      programs.waybar = {
        enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            # margin = "5 5 -2 5";

            modules-left = [
              "hyprland/workspaces"
              # "hyprland/language"
              "tray"
              # "keyboard-state"
              # "hyprland/submap"
            ];
            modules-center = [ "clock" ];
            modules-right = [
              # "custom/mem"
              # "cpu"
              "group/group1"
              "group/group2"
              "group/power"
            ];

            "group/group1" = {
              orientation = "inherit";
              modules = [
                "network"
                "bluetooth"
                "pulseaudio"
                # "pulseaudio#microphone"
                "idle_inhibitor"
              ];
            };

            "group/power" = {
              orientation = "inherit";
              drawer = {
                transition-duration = 500;
                children-class = "not-power";
                transition-left-to-right = false;
              };
              modules = [
                "custom/power" # First element is the "group leader" and won't ever be hidden
                "custom/quit"
                "custom/lock"
                "custom/reboot"
              ];
            };

            "group/group2" = {
              orientation = "inherit";
              modules = [
                "battery"
                "backlight"
              ];
            };

            "hyprland/workspaces" = {
              format = "{icon}";
              format-icons = {
                "active" = "󱨇";
                "default" = "";

              };
              disable-scroll = true;
              rotate = 0;
              all-outputs = true;
              active-only = false;
              on-click = "activate";
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

            tray = {
              icon-size = 16;
              spacing = 5;
            };

            clock = {
              # timezone = "America/New_York";
              format = "{:%a %d %b %H:%M}";
              tooltip-format = "<tt>{calendar}</tt>";
              calendar = {
                mode = "month";
                mode-mon-col = 3;
                on-scroll = 1;
                on-click-right = "mode";
                format = {
                  months = "<span color='#f9e2af'><b>{}</b></span>";
                  weekdays = "<span color='#cba6f7'><b>{}</b></span>";
                  today = "<span color='#f38ba8'><b>{}</b></span>";
                };
              };
              actions = {
                on-click-right = "mode";
                on-click-forward = "tz_up";
                on-click-backward = "tz_down";
                on-scroll-up = "shift_up";
                on-scroll-down = "shift_down";
              };
            };

            network = {
              tooltip = true;
              format-wifi = " ";
              rotate = 0;
              format-ethernet = "󰈀 ";
              tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
              format-linked = "󰈀 {ifname} (No IP)";
              format-disconnected = "󰖪 ";
              tooltip-format-disconnected = "Disconnected";
              format-alt = "<span foreground='#94e2d5'> {bandwidthDownBytes}</span> <span foreground='#fab387'> {bandwidthUpBytes}</span>";
              interval = 2;
            };

            bluetooth = {
              format = "";
              format-connected = "󰂱";
              format-disabled = "󰂲";
              rotate = 0;
              on-click = "blueman-manager";
              format-connected-battery = "{icon} {num_connections}";
              # "format-connected-battery" = "{icon} {device_alias}-{device_battery_percentage}%";
              format-icons = [
                "󰥇"
                "󰤾"
                "󰤿"
                "󰥀"
                "󰥁"
                "󰥂"
                "󰥃"
                "󰥄"
                "󰥅"
                "󰥆"
                "󰥈"
              ];
              # "format-device-preference" = [ "device1", "device2" ], // preference list deciding the displayed device If this config option is not defined or none of the devices in the list are connected, it will fall back to showing the last connected device.
              tooltip-format = "{controller_alias}\n{num_connections} connected";
              tooltip-format-connected = "{controller_alias}\n{num_connections} connected\n\n{device_enumerate}";
              tooltip-format-enumerate-connected = "{device_alias}";
              tooltip-format-enumerate-connected-battery = "{device_alias}\t{icon} {device_battery_percentage}%";
            };

            pulseaudio = {
              format = "{icon}  {volume}";
              rotate = 0;
              format-muted = "";
              on-click = "pavucontrol -t 3";
              tooltip-format = "{icon} {desc} // {volume}%";
              scroll-step = 5;
              format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = [
                  ""
                  ""
                  ""
                ];
              };
            };

            "pulseaudio#microphone" = {
              format = "{format_source}";
              rotate = 0;
              format-source = "";
              format-source-muted = "";
              on-click = "pavucontrol -t 4";
              tooltip-format = "{format_source} {source_desc} // {source_volume}%";
              scroll-step = 5;
            };

            cpu = {
              interval = 2;
              format = "{usage}% ";
              min-length = 6;
            };

            battery = {
              states = {
                warning = 30;
                critical = 15;
              };
              full-at = 96;
              format = "{icon} {capacity}%";
              format-charging = "󰂄 {capacity}%";
              format-plugged = " {capacity}%";
              format-alt = "{icon} {time}";
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

            backlight = {
              device = "intel_backlight";
              format = "{icon} {percent}%";
              format-icons = [
                ""
                ""
                ""
                ""
                ""
                ""
                ""
                ""
                ""
              ];
              on-scroll-up = "brightnessctl set 1%+";
              on-scroll-down = "brightnessctl set 1%-";
              tooltip = false;
            };

            "custom/quit" = {
              format = "󰗼";
              tooltip = false;
              on-click = "hyprctl dispatch exit";
            };

            "custom/lock" = {
              format = "󰍁";
              tooltip = false;
              on-click = "hyprlock";
            };

            "custom/reboot" = {
              format = "󰜉";
              tooltip = false;
              on-click = "reboot";
            };

            "custom/power" = {
              format = "";
              tooltip = false;
              on-click = "shutdown now";
            };

            idle_inhibitor = {
              format = "{icon}";
              format-icons = {
                activated = "󰖨";
                deactivated = "󰤄";
              };
              on-click = "~/walnut-environment/nonNix/scripts/caffeine.sh";
              tooltip-format-activated = "Caffeine mode // On";
              tooltip-format-deactivated = "Caffeine mode // Off";
            };
          };
        };

        style = ''
          * {
            border: none;
            border-radius: 0;
            /* `otf-font-awesome` is required to be installed for icons */
            font-size: 12px;
            font-family: JetBrains Mono Nerd Font;
            font-weight: bold;
            min-height: 18px;
          }

          window#waybar {
            background: @base;
            /* border-radius: 5px; */
          }

          window#waybar.hidden {
            opacity: 0.2;
          }

          tooltip {
            border-radius: 8px;
            border-width: 0px;
            background: @base;
          }

          tooltip label {
            color: @text;
          }

          #group1,
          #power {
            padding-left: 10px;
            padding-right: 10px;
            color: @text;
          }

          #group1 {
            margin-right: 8px;
          }

          #network {
            padding-left: 5px;
            padding-right: 2px;
          }

          #bluetooth,
          #pulseaudio,
          #pulseaudio#microphone,
          #idle_inhibitor {
            padding-left: 5px;
            padding-right: 5px;
          }

          #custom-power,
          #custom-quit,
          #custom-lock,
          #custom-reboot {
            padding-left: 10px;
            padding-right: 10px;
            border-radius: 10px;
            border-width: 0px;
            transition: none;
          }

          #custom-power {
            color: #f5c2e7;
          }

          #custom-quit {
            padding-left: 10px;
          }

          #group2 {
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 10px;
            margin-right: 8px;
            transition: none;
            color: @text;
          }

          #battery,
          #backlight {
            padding-left: 5px;
            padding-right: 5px;
          }

          #backlight {
            transition: none;
            color: @text;
          }

          #battery {
            transition: none;
            color: @text;
          }

          /* #battery.charging {
            color: @base;
            background-color: @green;
          } */

          #battery.warning:not(.charging) {
            color: @yellow;
          }

          #battery.critical:not(.charging) {
            color: @red;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
          }

          #workspaces {
            margin-right: 8px;
            padding-left: 8px;
            padding-right: 8px;
            border-radius: 10px;
            transition: none;
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
            color: @surface2;
            animation: ws_normal 20s ease-in-out 1;
          }

          #workspaces button.persistent {
            color: @surface2;
          }

          #workspaces button.active {
            /* background: #2B2F38; */
            color: @mauve;
            /* margin-left: 1px; 
            padding-left: 4px;
            padding-right: 8px;
            margin-right: 1px; */
            /* animation: ws_active 20s ease-in-out 1; */
            /* transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682); */
          }

          #workspaces button:hover {
            color: @mauve;
            box-shadow: none;
            text-shadow: none;
            background: none;
            transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
          }

          #language {
            padding-left: 12px;
            padding-right: 12px;
            border-radius: 10px;
            transition: none;
            color: @text;
          }

          #keyboard-state {
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
            color: @text;
          }

          #tray {
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 10px;
            transition: none;
            color: @text;
          }

          @keyframes blink {
            to {
              background-color: #ffffff;
              color: #000000;
            }
          }
        '';
      };
    })

    (lib.mkIf (config.walnutHome.waybar.enable && !config.walnutHome.waybar.group2.enable) {
      programs.waybar = {
        settings = {
          mainBar = {
            modules-right = lib.mkForce [
              # "custom/mem"
              # "cpu"
              "group/group1"
              "group/power"
            ];
          };
        };
      };
    })

    (lib.mkIf
      (config.walnutHome.hyprland.enable && builtins.isList config.walnutHome.hyprland.monitorSetup)
      {
        programs.waybar = {
          settings = {
            mainBar = {
              "hyprland/workspaces" = {
                persistent-workspaces = lib.mkForce { "*" = 6; };
              };
            };
          };
        };
      }
    )
  ];
}
