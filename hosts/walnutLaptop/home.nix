{
  inputs,
  pkgs,
  personal,
  ...
}:
{
  imports = [
    ./../common/home.nix
    inputs.sops-nix.homeManagerModules.sops
  ];

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
    jujutsu.enable = true;
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

  sops = {
    # This is the walnut/dev key and needs to have been copied to this location on the host
    age.keyFile = "/home/${personal.user}/.config/sops/age/keys.txt";

    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/walnut-laptop" = {
        path = "/home/${personal.user}/.ssh/id_ed25519";
      };
    };
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
