{
  lib,
  config,
  ...
}:
{
  options = {
    walnutDarwin.homebrew =
      let
        types = lib.types;
      in
      {
        enable = lib.mkEnableOption "enable homebrew";
        brews = lib.mkOption {
          default = [ ];
          type = with types; listOf str;
        };
        casks = lib.mkOption {
          default = [ ];
          type = with types; listOf str;
        };
      };
  };

  config = lib.mkIf config.walnutDarwin.homebrew.enable {
    homebrew = {
      enable = true;
      brews = config.walnutDarwin.homebrew.brews;
      casks = config.walnutDarwin.homebrew.casks;
      onActivation = {
        cleanup = "zap";
        autoUpdate = true;
        upgrade = true;
      };
    };
  };
}
