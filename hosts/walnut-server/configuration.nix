{ pkgs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../common/configuration.nix
  ];

  walnut = {
    anki.enable = lib.mkOverride false;
    bluetooth.enable = lib.mkOverride false;
    firefox.enable = lib.mkOverride false;
    fonts.enable = lib.mkOverride false;
    home-manager.enable = lib.mkOverride false;
    hyprland = {
      enable = lib.mkOverride false;
      screenshot.enable = lib.mkOverride false;
    };
    keymapp.enable = lib.mkOverride false;
    libreoffice.enable = lib.mkOverride false;
    mullvad.enable = lib.mkOverride false;
    qt-libs.enable = lib.mkOverride false;
    sddm.enable = lib.mkOverride false;
    signal.enable = lib.mkOverride false;
    sound.enable = lib.mkOverride false;
    swap.enable = lib.mkOverride false;
    thunar.enable = lib.mkOverride false;
    tor-browser.enable = lib.mkOverride false;
    obsidian.enable = lib.mkOverride false;
    users.enable = lib.mkOverride false;
    vesktop.enable = lib.mkOverride false;
    vlc.enable = lib.mkOverride false;
    xdg-portal.enable = lib.mkOverride false;
    xkb.enable = lib.mkOverride false;
    zsa.enable = lib.mkOverride false;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "walnut-server"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.walnut = {
    isNormalUser = true;
    description = "walnut-server";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQCjJqY4aAGqN7NroiFadKXW5XAryPt5SaJIH2YNGjs zenoix@walnut-laptop"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

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
  system.stateVersion = lib.mkOverride "25.05"; # Did you read the comment?

}
