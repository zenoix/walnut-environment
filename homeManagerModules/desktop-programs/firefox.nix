{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  options = {
    walnutHome.firefox.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.walnutHome.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles =
        let
          extensionsConfig = {
            extensions = {
              packages = with inputs.firefox-addons.packages.${pkgs.system}; [
                bitwarden
                darkreader
                firefox-color
                return-youtube-dislikes
                stylus
                tabliss
                ublock-origin
                vimium
                youtube-nonstop
              ];
            };
          };

          customCSSConfig = {
            settings = {
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
            };
            userChrome = builtins.readFile ../../nonNix/firefox/userChrome.css;
          };

          commonSettings = extensionsConfig // customCSSConfig;
        in
        {
          default = commonSettings // {
            id = 0;
          };
          default-release = commonSettings // {
            id = 1;
          };
          default-rebase = commonSettings // {
            id = 2;
          };
        };
    };

    stylix.targets.firefox.profileNames = lib.mkIf (config.walnutHome.stylix.enable == true) [
      "default"
      "default-rebase"
    ];
  };
}
