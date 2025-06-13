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
      monitor-setup = "double";
    };
    hyprlock.enable = true;
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
