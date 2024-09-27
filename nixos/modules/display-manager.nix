{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./sddm_theme.nix { inherit pkgs; }}";
  };
}
