{
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.awscli.enable = lib.mkEnableOption "enable awscli";
  };

  config = lib.mkIf config.walnutHome.awscli.enable {
    programs.awscli.enable = true;
  };
}
