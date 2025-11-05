{
  nix.settings.download-buffer-size = 524288000;

  walnutHome = {
    xdgPortal.enable = true;
  };

  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
    enable = true;
    associations = {
      added = {
        "application/zip" = "thunar.desktop";
      };
      removed = {
        "inode/directory" = "org.pwmt.zathura-cb.desktop";
      };
    };
    defaultApplications = {
      "inode/directory" = "thunar.desktop";
      "x-scheme-handler/discord" = "vesktop.desktop";
      "x-scheme-handler/sgnl" = "signal.desktop";
      "x-scheme-handler/signalcaptcha" = "signal.desktop";

      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
