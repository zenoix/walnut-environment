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
        font-size = lib.mkForce 10;
        font-family = "SFMono Nerd Font";
        # enable_audio_bell = false;
        # window_padding_width = 5;
        # background_blur = 1;
      };
    };
  };
}
