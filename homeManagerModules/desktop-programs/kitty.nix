{ lib, config, ... }:
{
  options = {
    walnutHome.kitty.enable = lib.mkEnableOption "enable kitty";
  };

  config = lib.mkIf config.walnutHome.kitty.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = lib.mkForce "Monaspace Neon";
        size = lib.mkForce 10;
      };

      settings = {
        enable_audio_bell = false;
        window_padding_width = 5;
        background_blur = 1;
      };
    };
  };
}
