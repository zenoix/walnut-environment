{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.fonts.enable = lib.mkEnableOption "enable fonts";
  };

  config = lib.mkIf config.walnut.fonts.enable {
    fonts.packages = with pkgs-unstable; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.monaspace
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
    ];
  };
}
