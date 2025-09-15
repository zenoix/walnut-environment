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

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        OverridePostUpdatePage = "";
      };

      profiles =
        let
          extensionsConfig = {
            extensions = {
              packages = with inputs.firefox-addons.packages.${pkgs.system}; [
                bitwarden
                darkreader
                firefox-color
                multi-account-containers
                return-youtube-dislikes
                sponsorblock
                stylus
                tabliss
                ublock-origin
                vimium
                youtube-nonstop
              ];

              force = true;
            };

          };

          otherSettings = {
            userChrome = builtins.readFile ../../nonNix/firefox/userChrome.css;

            settings = {
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css

              "extensions.autoDisableScopes" = 0;
              "extensions.htmlaboutaddons.recommendations.enabled" = false;

              "signon.rememberSignons" = false;

              "browser.aboutConfig.showWarning" = false;
              "browser.urlbar.suggest.topsites" = false;
              "browser.urlbar.suggest.trending" = false;
              "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
              "browser.urlbar.suggest.quicksuggest.sponsored" = false;
              "browser.urlbar.suggest.yelp" = false;
            };
          };

          commonSettings = extensionsConfig // otherSettings;
        in
        {
          default = commonSettings // {
            id = 0;
            isDefault = true;
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
