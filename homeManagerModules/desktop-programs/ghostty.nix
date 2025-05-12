{ lib, config, ... }:
{
  options = {
    walnut-home.ghostty.enable = lib.mkEnableOption "enable ghostty";
  };

  config = lib.mkIf config.walnut-home.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      installBatSyntax = true;
      installVimSyntax = true;
      settings = {
        font-family = "Monaspace Neon";
        font-size = 10;
        font-feature = "calt,ss01,ss02,ss03,ss04,ss06,ss07,ss08,ss09,liga";
        window-padding-x = 5;
        window-padding-y = 5;
        resize-overlay = "never";
      };
    };
  };
}
