{
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
      };
      userChrome = builtins.readFile ./userChrome.css;
    };
  };
}
