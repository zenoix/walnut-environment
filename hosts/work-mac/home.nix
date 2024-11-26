{
  pkgs,
  lib,
  work,
  ...
}:
{
  imports = [ ./../common/home.nix ];

  home = {
    username = "${work.user}";
    homeDirectory = "/Users/${work.user}";

    packages = with pkgs; [
      cocogitto
      coreutils
      fd
      gcc
      git
      gnumake
      go
      home-manager
      htop
      killall
      tree
      unzip
      wget
      xclip
      zip
      (python312.withPackages (ps: with ps; [ requests ]))

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
    kitty.enable = true;
  };

  stylix.opacity.terminal = lib.mkForce 0.97;

  programs.kitty = {
    font.size = lib.mkForce 13;
  };
}
