{
  lib,
  config,
  ...
}:
{
  options = {
    walnut.terminfo.enable = lib.mkEnableOption "install all terminfo";
  };

  config = lib.mkIf config.walnut.terminfo.enable {
    environment.enableAllTerminfo = true;
  };
}
