{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.i18n.enable = lib.mkEnableOption "enable i18n";
  };

  config = lib.mkIf config.walnutHome.i18n.enable {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          qt6Packages.fcitx5-configtool
          qt6Packages.fcitx5-chinese-addons
        ];

        settings = {
          globalOptions = {
            "Hotkey/TriggerKeys" = {
              "0" = "Super+space";
            };
          };

          inputMethod = {
            GroupOrder."0" = "Default";
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "nz";
              DefaultIM = "mozc";
            };
            "Groups/0/Items/0".Name = "keyboard-nz";
            "Groups/0/Items/1".Name = "mozc";
            "Groups/0/Items/2".Name = "pinyin";
          };
        };

        waylandFrontend = true;
      };
    };
  };
}
