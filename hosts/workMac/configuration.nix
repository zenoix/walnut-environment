{
  pkgs,
  config,
  work,
  ...
}:
{
  nix.settings = {
    ssl-cert-file = "/etc/nix/ca_cert.pem";
  };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ ];

  walnutDarwin = {
    homebrew = {
      enable = true;
      brews = [ ];
      casks = [
        "ghostty"
        "firefox"
        "obsidian"
        "slack"
      ];
    };
  };

  system = {
    stateVersion = 6;
    primaryUser = "${work.user}";

    defaults = {
      dock = {
        autohide = true;
        persistent-apps = [
          "/Applications/Firefox.app"
          "/Applications/Ghostty.app"
          "/Applications/Microsoft Teams.app"
          "/Applications/Slack.app/"
          "/Applications/Microsoft Outlook.app"
          "/Applications/Obsidian.app"
          "/System/Applications/System Settings.app"
        ];

        # disable hot corners
        wvous-tl-corner = 1;
        wvous-bl-corner = 1;
        wvous-tr-corner = 1;
        wvous-br-corner = 1;
      };

      finder = {
        FXPreferredViewStyle = "clmv";
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };

      trackpad = {
        Clicking = true; # enable tap to click
        TrackpadRightClick = true; # enable two finger right click
        TrackpadThreeFingerDrag = false; # enable three finger drag
      };

      loginwindow.GuestEnabled = false;

      NSGlobalDomain = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
        "com.apple.swipescrolldirection" = true; # enable natural scrolling
        "com.apple.sound.beep.feedback" = 0; # disable beep sound when pressing volume up/down key
        NSWindowShouldDragOnGesture = true;
      };
    };

    # turn off startup noise
    startup.chime = false;
  };

  security = {
    pam.services.sudo_local.touchIdAuth = true;
  };

  system.activationScripts."ssl-ca-cert-fix".text = ''
    if [ ! -f /etc/nix/ca_cert.pem ]; then
      security export -t certs -f pemseq -k /Library/Keychains/System.keychain -o /tmp/certs-system.pem
      security export -t certs -f pemseq -k /System/Library/Keychains/SystemRootCertificates.keychain -o /tmp/certs-root.pem
      cat /tmp/certs-root.pem /tmp/certs-system.pem > /tmp/ca_cert.pem
      sudo mv /tmp/ca_cert.pem /etc/nix/
    fi
  '';

  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';

  nix.settings.experimental-features = "nix-command flakes";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

}
