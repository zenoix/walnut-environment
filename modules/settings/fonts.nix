{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    fonts.enable = lib.mkEnableOption "enable fonts";
  };

  config = lib.mkIf config.fonts.enable {
    fonts.packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      twemoji-color-font
      font-awesome
      powerline-fonts
      powerline-symbols
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
}
