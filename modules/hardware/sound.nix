{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    sound.enable = lib.mkEnableOption "enable sound";
  };

  config = lib.mkIf config.sound.enable {
    sound.enable = true;

    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
      pamixer
      pavucontrol
      pulseaudio
      playerctl
    ];
  };
}
