{ lib, config, ... }:
{
  options = {
    walnut-home.firefox.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.walnut-home.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles.default = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
        };
        userChrome = builtins.readFile ../../nonNix/firefox/userChrome.css;
      };
    };

    stylix.targets.firefox.profileNames = lib.mkIf (config.walnut-home.stylix.enable == true) [
      "default"
    ];
  };
}
