{ pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    stateVersion = "24.05";

    packages = with pkgs; [ ];
  };

  fonts.fontconfig.enable = true;

  walnut-home = {
    bat.enable = true;
    direnv.enable = true;
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
