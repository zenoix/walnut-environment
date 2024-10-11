{ lib, config, ... }:
{
  options = {
    stylix.enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf config.stylix.enable {
    imports = [ ../themes/stylix.nix ];

    stylix = {
      targets = {
        grub.enable = false;
      };
    };
  };
}
