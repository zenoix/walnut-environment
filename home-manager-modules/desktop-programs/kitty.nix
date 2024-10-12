{ lib, config, ... }:
{
  options = {
    walnut-home.kitty.enable = lib.mkEnableOption "enable kitty";
  };

  config = lib.mkIf config.walnut-home.kitty.enable {
    programs.kitty = {
      enable = true;
      # font = {
      #   name = "JetBrainsMono";
      # };

      settings = {
        enable_audio_bell = false;
        window_padding_width = 5;
        background_blur = 1;
      };
    };
  };
}
