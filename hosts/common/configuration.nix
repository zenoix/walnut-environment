# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ personal, config, ... }:

{
  imports = [ ./../../modules ];

  walnut = {
    anki.enable = true;
    bluetooth.enable = true;
    coding-stuff.enable = true;
    docker.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    home-manager.enable = true;
    hyprland = {
      enable = true;
      screenshot.enable = true;
    };
    kitty.enable = true;
    libreoffice.enable = true;
    locale.enable = true;
    mullvad.enable = true;
    neovim.enable = true;
    networking.enable = true;
    qt-libs.enable = true;
    sddm.enable = true;
    shell-config.enable = true;
    signal.enable = true;
    sound.enable = true;
    stylix.enable = true;
    swap.enable = true;
    thunar.enable = true;
    tor-browser.enable = true;
    obsidian.enable = true;
    users.enable = true;
    vesktop.enable = true;
    vlc.enable = true;
    xdg-portal.enable = true;
    xkb.enable = true;
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Delete configurations older than 30 days
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Set your time zone.
  time.timeZone = "${personal.timeZone}";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
