{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "\${pkgs.kitty}/bin/kitty";

    extraConfig = {
      show-icons = true;
      icon-theme = "Papirus-Dark";
    };
  };
}
