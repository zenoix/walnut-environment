{ pkgs, personal, ... }:
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
        "DP-2,preferred,0x0,1"
        "DP-3,preferred,2560x-560,1,transform,1"
      ];
      monitorWorkspaceBindings = {
        "1" = "DP-2";
        "2" = "DP-2";
        "3" = "DP-2";

        "4" = "DP-3";
        "5" = "DP-3";
        "6" = "DP-3";
      };
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

  programs.ssh = {
    enable = true;
    matchBlocks = {
      walnut-server = {
        hostname = "10.0.0.56";
        user = "walnut";
        identityFile = "/home/${personal.user}/.ssh/id_ed25519";
      };
    };
  };
}
