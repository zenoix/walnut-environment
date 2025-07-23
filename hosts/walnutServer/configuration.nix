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

  walnut = lib.mkForce {
    bazarr.enable = true;
    cloudflared.enable = true;
    fail2ban.enable = true;
    flaresolverr.enable = true;
    home-manager.enable = true;
    jellyfin.enable = true;
    jellyseerr.enable = true;
    mullvad.enable = true;
    networking.enable = true;
    prowlarr.enable = true;
    qbittorrent.enable = true;
    radarr.enable = true;
    shell-config.enable = true;
    sonarr.enable = true;
    sops.enable = true;
    terminfo.enable = true;
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
      lib.concatStringsSep " " [
        "${pkgs.mullvad}/bin/mullvad-exclude"
        (lib.getExe' config.services.openssh.package "sshd")
        "-D"
        "-f"
        "/etc/ssh/sshd_config"
      ]
    );
    RestartSec = 20;
  };

  networking = {
    interfaces.enp171s0.useDHCP = false;
    useDHCP = false;
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
            tcp dport 7070 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp dport 9696 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp dport 7878 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp dport 8989 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp dport 8191 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp dport 5055 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp dport 6767 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
          }

          chain allowOutgoing {
            type route hook output priority -100; policy accept;
            tcp sport 9696 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp sport 7878 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp sport 8989 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp sport 8191 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp sport 5055 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
            tcp sport 6767 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
          }
        '';
      };
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    # qbittorrent webui
    8080
    7070

    # jellyseerr
    5055

    # prowlarr
    9696

    # radarr
    7878

    # sonarr
    8989

    # flaresolverr
    8191

    # bazarr
    6767
  ];
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
