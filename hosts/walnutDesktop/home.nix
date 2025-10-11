{ pkgs, personal, ... }:
let
  mainMonitor = "DP-2";
  secondaryMonitor = "DP-3";
in
{
  imports = [ ./../common/home.nix ];

  home = {
    username = "${personal.user}";
    homeDirectory = "/home/${personal.user}";

    packages = with pkgs; [ ];
  };

  walnutHome = {
    anki.enable = true;
    appflowy.enable = true;
    cava.enable = true;
    dunst.enable = true;
    firefox.enable = true;
    gammastep.enable = true;
    gtk-config.enable = true;
    hypridle.enable = false;
    hyprland = {
      enable = true;
      monitorSetup = [
        "${mainMonitor},preferred,0x0,1"
        "${secondaryMonitor},preferred,2560x-560,1,transform,1"
      ];
      monitorWorkspaceBindings = {
        "1" = mainMonitor;
        "2" = mainMonitor;
        "3" = mainMonitor;

        "4" = secondaryMonitor;
        "5" = secondaryMonitor;
        "6" = secondaryMonitor;
      };
      screenshot.enable = true;
    };
    hyprlock.enable = true;
    hyprpaper.enable = true;
    i18n.enable = true;
    kitty.enable = false;
    obs.enable = true;
    rofi.enable = true;
    spicetify.enable = true;
    syncthing.enable = true;
    tmux.sessionizerDirectories = [
      "~/"
      "~/repos"
    ];
    waybar = {
      enable = true;
      group2.enable = false;
    };
    zathura.enable = true;
  };

  programs.waybar.settings = {
    mainBar.output = [ mainMonitor ];
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      walnut-server = {
        hostname = "10.0.0.56";
        user = "walnut";
        identityFile = "/home/${personal.user}/.ssh/id_ed25519";
      };
    };
  };
}
