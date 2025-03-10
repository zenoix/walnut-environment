{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.sound.enable = lib.mkEnableOption "enable sound";
  };

  config = lib.mkIf config.walnut.sound.enable {
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
