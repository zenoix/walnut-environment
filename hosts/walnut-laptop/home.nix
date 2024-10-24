{ pkgs, personal, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "${personal.user}";
    homeDirectory = "/home/${personal.user}";
    stateVersion = "24.05";

    packages = with pkgs; [ ];
  };

  walnut-home = {
    bat.enable = true;
    cava.enable = true;
    direnv.enable = true;
    dunst.enable = true;
    fastfetch.enable = true;
    firefox.enable = true;
    fzf.enable = true;
    git.enable = true;
    gtk-config.enable = true;
    hypridle.enable = true;
    hyprland = {
      enable = true;
      mouse-sensitivity = "-0.15";
    };
    hyprlock.enable = true;
    i18n.enable = true;
    kitty.enable = true;
    nixvim.enable = true;
    obs.enable = true;
    ripgrep.enable = true;
    rofi.enable = true;
    ruff.enable = true;
    spicetify.enable = true;
    starship.enable = true;
    stylix.enable = true;
    syncthing.enable = true;
    tmux.enable = true;
    waybar.enable = true;
    yazi.enable = true;
    zathura.enable = true;
    zoxide.enable = true;
    zsh.enable = true;
  };
}
