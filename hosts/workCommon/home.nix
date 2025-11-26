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

    packages =
      with pkgs;
      [
        azure-cli
        cocogitto
        fd
        gcc
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

      ]
      ++ (with pkgs; [
        jetbrains-mono
        monaspace
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        twemoji-color-font
        font-awesome
        powerline-fonts
        powerline-symbols
        nerd-fonts.jetbrains-mono
        nerd-fonts.monaspace
      ]);
  };

  fonts.fontconfig.enable = true;

  walnutHome = {
    git-work.enable = lib.mkForce true;
    uv.enable = true;
    xdgPortal.enable = lib.mkForce false;
  };

  programs.gh = {
    settings = {
      git_protocol = lib.mkForce "https";
    };
  };

  catppuccin = {
    cursors.enable = false;
    dunst.enable = false;
    fcitx5.enable = false;
    gtk.icon.enable = false;
    hyprland.enable = false;
    hyprlock.enable = false;
    mako.enable = false;
    mpv.enable = false;
    sway.enable = false;
    swaylock.enable = false;
    swaync.enable = false;
    waybar.enable = false;
    wlogout.enable = false;
    xfce4-terminal.enable = false;
  };
}
