{
  pkgs,
  lib,
  config,
  personal,
  ...
}:
{
  options = {
    walnutHome.jujutsu.enable = lib.mkEnableOption "enable jujutsu";
  };

  config = lib.mkIf config.walnutHome.jujutsu.enable {
    programs.jujutsu = {
      enable = true;
      package = pkgs.jujutsu;
      settings = {
        user = {
          email = personal.gitEmail;
          user = personal.gitUser;
        };

        aliases = {
          init = [
            "git"
            "init"
          ];
        };
      };
    };
  };
}
