{ pkgs, ... }:
{
  nix = {
    package = pkgs.nix;

    # Delete configurations older than 30 days
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 30d";
    };

    settings = {
      download-buffer-size = 524288000;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    stateVersion = "25.05";

    packages = with pkgs; [ ];

    sessionVariables = {
      DEVBOX_NO_PROMPT = "true";
      MANPAGER = "nvim +Man!";
    };
  };

  fonts.fontconfig.enable = true;

  walnutHome = {
    bat.enable = true;
    devbox.enable = true;
    direnv.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    gh.enable = true;
    ghostty.enable = true;
    git.enable = true;
    git-work.enable = false;
    nixvim.enable = true;
    ripgrep.enable = true;
    ruff.enable = true;
    starship.enable = true;
    stylix.enable = true;
    tmux.enable = true;
    xdgPortal.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
    zsh.enable = true;
  };
}
