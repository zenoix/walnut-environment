{ pkgs, work, ... }:
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
      permittedInsecurePackages = [
        "python-2.7.18.8"
        "electron-25.9.0"
      ];
    };
  };

  home = {
    username = "${work.user}";
    homeDirectory = "/home/${work.user}";
    stateVersion = "24.05";

    packages = with pkgs; [
      cocogitto
      fd
      gcc
      git
      gnumake
      go
      htop
      killall
      nodejs
      tree
      unzip
      wget
      zip
      (python3.withPackages (ps: with ps; [ requests ]))

      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  fonts.fontconfig.enable = true;

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
