{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    sddm.enable = lib.mkEnableOption "enable sddm";
  };
  config = lib.mkIf config.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./sddm_theme.nix { inherit pkgs; }}";
    };
  };
}
