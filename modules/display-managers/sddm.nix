{
  pkgs,
  lib,
  config,
  ...
}:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
  };
in
{
  options = {
    walnut.sddm.enable = lib.mkEnableOption "enable sddm";
  };
  config = lib.mkIf config.walnut.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = [ sddm-astronaut ];
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
    };

    environment.systemPackages = [ sddm-astronaut ];
  };
}
