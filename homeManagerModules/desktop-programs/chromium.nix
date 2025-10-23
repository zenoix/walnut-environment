{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.chromium.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.walnutHome.chromium.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.chromium.override { enableWideVine = true; };

      extensions = [
        { id = "hkledmpjpaehamkiehglnbelcpdflcab"; } # asbplayer
        { id = "likgccmbimhjbgkjambclfkhldnlhbnn"; } # yomitan
      ];
    };
  };
}
