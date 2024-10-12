{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.sddm.enable = lib.mkEnableOption "enable sddm";
  };
  config = lib.mkIf config.walnut.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./sddm_theme.nix { inherit pkgs; }}";
    };
  };
}
