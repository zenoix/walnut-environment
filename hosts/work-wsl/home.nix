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
    fastfetch.enable = true;
    fzf.enable = true;
    git.enable = true;
    nixvim.enable = true;
    ripgrep.enable = true;
    ruff.enable = true;
    starship.enable = true;
    stylix.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
    zsh.enable = true;
  };
}
