{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    coding-stuff.enable = lib.mkEnableOption "enable coding-stuff";
  };

  config = lib.mkIf config.coding-stuff.enable {
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
