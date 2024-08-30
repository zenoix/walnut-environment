{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

    environment.systemPackages = with pkgs; [
      # Desktop apps
      discord
      dolphin
      firefox
      gparted
      kitty
      mpv
      obs-studio
      pcmanfm-qt
      rofi
      signal-desktop
      wofi
  
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
      fastfetch
      ffmpeg
      file
      git
      htop
      light
      lux
      mediainfo
      neofetch
      nix-index
      ntfs3g
      openssl
      ranger
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
      gromit-mpx
      imv
      mako
      screenkey
  
      # Xorg stuff
      #xterm
      #xclip
      #xorg.xbacklight
  
      # Wayland stuff
      cliphist
      wl-clipboard
      xwayland
  
      # WMs and stuff
      base16-schemes
      herbstluftwm
      hyprland
      hyprlock
      hyprpaper
      polybar
      seatd
      waybar
      xdg-desktop-portal-hyprland
  
      # Sound
      pamixer
      pipewire
      pulseaudio
  
      # Screenshotting
      flameshot
      grim
      grimblast
      slurp
      swappy
  
      # Other
      home-manager
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugin-kvantum
      papirus-nord
      spice-vdagent
    ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
