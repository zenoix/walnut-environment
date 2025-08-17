{ pkgs, personal, ... }:
{
  imports = [ ./../common/home.nix ];

  home = {
    username = "${personal.user}";
    homeDirectory = "/home/${personal.user}";

    packages = with pkgs; [ ];
  };

  walnutHome = {
    cava.enable = true;
    dunst.enable = true;
    firefox.enable = true;
    gammastep.enable = true;
    gtk-config.enable = true;
    hypridle.enable = false;
    hyprland = {
      enable = true;
      monitorSetup = [
        "DP-2,preferred,0x0,1,bitdepth,10"
        "DP-3,preferred,2560x-560,1,bitdepth,10,transform,1"
      ];
    };
    hyprlock.enable = true;
    hyprpaper.enable = true;
    i18n.enable = true;
    kitty.enable = false;
    obs.enable = true;
    rofi.enable = true;
    spicetify.enable = true;
    syncthing.enable = true;
    waybar = {
      enable = true;
      group2.enable = false;
    };
    zathura.enable = true;
  };
}
