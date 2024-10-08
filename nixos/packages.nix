{ pkgs, pkgs-unstable, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0"
    ];
  };

  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs-unstable.neovim-unwrapped;
  };

  programs.thunar.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox
    kitty
    libreoffice-qt6-fresh
    obs-studio
    rofi-wayland
    signal-desktop
    vlc
    zathura

    # Coding stuff
    gcc
    gnumake
    go
    nodejs
    python
    (python3.withPackages (ps: with ps; [ requests ]))

    # CLI utils
    bluez
    bluez-tools
    brightnessctl
    cava
    cocogitto
    fastfetch
    fd
    ffmpeg
    file
    git
    htop
    killall
    light
    lux
    mediainfo
    nix-index
    ntfs3g
    openssl
    scrot
    swww
    tmux
    tree
    unzip
    wget
    yt-dlp
    zip
    zram-generator

    # GUI utils
    dmenu
    feh
    imv
    libnotify

    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    cliphist
    wl-clipboard
    xwayland
    dunst

    # WMs and stuff
    base16-schemes
    herbstluftwm
    hyprland
    hyprlock
    polybar
    seatd
    waybar
    xdg-desktop-portal-gtk

    # Sound
    pamixer
    pavucontrol
    pipewire
    pulseaudio
    playerctl

    # Screenshotting
    grim
    grimblast
    slurp
    swappy

    # Other
    home-manager
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    papirus-nord
    pop-icon-theme
    spice-vdagent
  ];

  fonts.packages = with pkgs; [
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
}
