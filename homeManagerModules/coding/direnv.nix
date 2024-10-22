{ lib, config, ... }:
{
  options = {
    walnut-home.direnv.enable = lib.mkEnableOption "enable direnv";
  };

  config = lib.mkIf config.walnut-home.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
