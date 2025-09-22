{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options = {
    walnutHome.spicetify.enable = lib.mkEnableOption "enable spicetify";
  };

  config = lib.mkIf config.walnutHome.spicetify.enable {
    programs.spicetify = {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        copyToClipboard
        fullAppDisplay
        shuffle
        wikify
      ];

      enabledCustomApps = with spicePkgs.apps; [
        lyricsPlus
        newReleases
      ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
  };
}
