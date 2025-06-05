{
  lib,
  config,
  ...
}:
{
  options = {
    walnut.fail2ban.enable = lib.mkEnableOption "enable fail2ban";
  };

  config = lib.mkIf config.walnut.fail2ban.enable {
    services.fail2ban = {
      enable = true;
    };
  };
}
