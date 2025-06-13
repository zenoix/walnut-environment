{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.gh.enable = lib.mkEnableOption "enable github cli";
  };

  config = lib.mkIf config.walnutHome.gh.enable {
    programs.gh = {
      enable = true;

      settings = {
        git_protocol = "ssh";
      };
    };
  };
}
