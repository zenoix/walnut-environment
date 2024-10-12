{ pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0"
    ];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    libreoffice-qt6-fresh
    signal-desktop
    vlc

    # CLI utils
    cocogitto

    # Other
    pop-icon-theme
  ];

}
