{ lib, config, ... }:
{
  options = {
    walnutHome.direnv.enable = lib.mkEnableOption "enable direnv";
  };

  config = lib.mkIf config.walnutHome.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
