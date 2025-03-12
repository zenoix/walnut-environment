{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.gh.enable = lib.mkEnableOption "enable github cli";
  };

  config = lib.mkIf config.walnut-home.gh.enable {
    programs.gh = {
      enable = true;

      settings = {
        git_protocol = "ssh";
      };
    };
  };
}
