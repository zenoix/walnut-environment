{
  pkgs,
  config,
  lib,
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
    cloudflared.enable = true;
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
    mullvad.enable = true;
    prowlarr.enable = true;
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
    xkb.enable = lib.mkForce false;
    zsa.enable = lib.mkForce false;
  };

  sops = {
    # secrets will be output to /run/secrets
    # e.g. /run/secrets/foo
    # secrets required for user creation are handled in respective ./user/<username>.nix files
    # because they will be output to /run/secrets-for-users and only when the user is assigned to a host
    secrets = {
      cloudflared-creds = { };
    };
  };

  nix.settings.trusted-users = [ "walnut" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "walnut-server"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${server.user} = {
    isNormalUser = true;
    description = "walnut-server";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../keys/walnutLaptop/id_ed25519.pub)
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

  systemd.services.sshd.serviceConfig = {
    ExecStart = lib.mkForce (
      lib.concatStringsSep "" [
        "${pkgs.mullvad}/bin/mullvad-exclude"
        (lib.getExe' config.services.openssh.package "sshd")
        "-D"
        "-f"
        "/etc/ssh/sshd_config"
      ]
    );
    RestartSec = 20;
  };

  networking.nftables = {
    enable = true;
    tables = {
      excludeTraffic = {
        family = "inet";
        content = ''
          chain allowIncoming {
            type filter hook input priority -100; policy accept;
            udp dport 22 ct mark set 0x00000f41;
            tcp dport 22 ct mark set 0x00000f41;
          }
        '';
      };
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
