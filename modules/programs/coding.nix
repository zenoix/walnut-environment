{
  pkgs,
  pkgs-unstable,
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
      permittedInsecurePackages = [ "electron-25.9.0" ];
    };

    environment.systemPackages = with pkgs; [
      cocogitto
      git
      gcc
      gnumake
      go
      pkgs-unstable.nodejs
      (python312.withPackages (ps: with ps; [ requests ]))
    ];
  };
}
