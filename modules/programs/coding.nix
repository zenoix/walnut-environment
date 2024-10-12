{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.coding-stuff.enable = lib.mkEnableOption "enable coding-stuff";
  };

  config = lib.mkIf config.walnut.coding-stuff.enable {
    nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "python-2.7.18.8"
        "electron-25.9.0"
      ];
    };

    environment.systemPackages = with pkgs; [
      git
      gcc
      gnumake
      go
      nodejs
      python
      (python3.withPackages (ps: with ps; [ requests ]))
    ];
  };
}
