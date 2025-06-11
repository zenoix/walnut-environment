{ lib, config, ... }:
{
  options = {
    walnut-home.firefox.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.walnut-home.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles =
        let
          customCSSConfig = {
            settings = {
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
            };
            userChrome = builtins.readFile ../../nonNix/firefox/userChrome.css;
          };
        in
        {
          default = customCSSConfig // {
            id = 0;
          };
          default-release = customCSSConfig // {
            id = 1;
          };
          default-rebase = customCSSConfig // {
            id = 2;
          };
        };
    };

    stylix.targets.firefox.profileNames = lib.mkIf (config.walnut-home.stylix.enable == true) [
      "default"
      "default-rebase"
    ];
  };
}
