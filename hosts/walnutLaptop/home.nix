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
    hypridle.enable = true;
    hyprland = {
      enable = true;
      mouse-sensitivity = "-0.15";
    };
    hyprlock.enable = true;
    i18n.enable = true;
    kitty.enable = false;
    obs.enable = true;
    rofi.enable = true;
    sioyek.enable = true;
    spicetify.enable = true;
    syncthing.enable = true;
    uv.enable = true;
    waybar.enable = true;
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
