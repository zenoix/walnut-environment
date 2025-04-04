{
  pkgs,
  lib,
  work,
  inputs,
  ...
}:
{
  imports = [ ./../common/home.nix ];

  home = {
    username = "${work.user}";
    homeDirectory = "/Users/${work.user}";

    file = {
      ".config/aerospace/aerospace.toml".source = ./../../homeManagerModules/wm/aerospace.toml;
      ".hushlogin".text = "";
    };

    packages = with pkgs; [
      azure-cli
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
      inputs.apple-fonts.packages.${pkgs.system}.sf-mono-nerd
    ];
  };

  fonts.fontconfig.enable = true;

  walnut-home = {
    ghostty.enable = lib.mkForce false;
    kitty.enable = true;
    uv.enable = true;
  };

  stylix.opacity.terminal = lib.mkForce 0.97;

  programs.kitty = {
    font.size = lib.mkOverride 30 13;
  };
}
