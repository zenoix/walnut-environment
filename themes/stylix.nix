{ pkgs, ... }: {
  stylix = {
    enable = true;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # Stylix needs an image for some reason
    image = ../assets/fuji-palette.png;

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrainsMono";
      };
    };

    cursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 24;
    };

    opacity.terminal = 0.95;

  };
}
