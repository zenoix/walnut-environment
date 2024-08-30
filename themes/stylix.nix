{ pkgs, ... }: {
  stylix ={
    enable = true;
    polarity = "dark";
    image = ../assets/wallpaper.jpeg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
	name = "JetBrainsMono";
      };
    };

    opacity.terminal = 0.975;

  };
}
