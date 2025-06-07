{
  pkgs,
  lib,
  config,
  server,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../common/configuration.nix
  ];

  walnut = {
    anki.enable = lib.mkForce false;
    bluetooth.enable = lib.mkForce false;
    fail2ban.enable = true;
    firefox.enable = lib.mkForce false;
    fonts.enable = lib.mkForce false;
    hyprland = {
      enable = lib.mkForce false;
      screenshot.enable = lib.mkForce false;
    };
    jellyfin.enable = true;
    jellyseerr.enable = true;
    keymapp.enable = lib.mkForce false;
    libreoffice.enable = lib.mkForce false;
    mullvad.enable = lib.mkForce false;
    qt-libs.enable = lib.mkForce false;
    sddm.enable = lib.mkForce false;
    signal.enable = lib.mkForce false;
    sops.enable = true;
    sound.enable = lib.mkForce false;
    swap.enable = lib.mkForce false;
    terminfo.enable = true;
    thunar.enable = lib.mkForce false;
    tor-browser.enable = lib.mkForce false;
    obsidian.enable = lib.mkForce false;
    users.enable = lib.mkForce false;
    vesktop.enable = lib.mkForce false;
    vlc.enable = lib.mkForce false;
    xdg-portal.enable = lib.mkForce false;
    xkb.enable = lib.mkForce false;
    zsa.enable = lib.mkForce false;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "walnut-server"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  sops.secrets."user-passwords/walnut".neededForUsers = true;
  users.mutableUsers = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${server.user} = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."user-passwords/walnut".path;
    description = "walnut-server";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQCjJqY4aAGqN7NroiFadKXW5XAryPt5SaJIH2YNGjs zenoix@walnut-laptop"
    ];
    shell = pkgs.zsh;
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
  system.stateVersion = lib.mkForce "25.05"; # Did you read the comment?

}
