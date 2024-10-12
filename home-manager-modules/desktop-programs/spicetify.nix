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
    walnut-home.spicetify.enable = lib.mkEnableOption "enable spicetify";
  };

  config = lib.mkIf config.walnut-home.spicetify.enable {
    programs.spicetify = {
      enable = true;

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
        wikify
      ];

      enabledCustomApps = with spicePkgs.apps; [
        lyricsPlus
        newReleases
      ];
    };
  };
}
