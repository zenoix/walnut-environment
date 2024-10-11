{ personal, ... }:
{
  # Select internationalisation properties.
  i18n.defaultLocale = "${personal.defaultLocale}";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${personal.defaultLocale}";
    LC_IDENTIFICATION = "${personal.defaultLocale}";
    LC_MEASUREMENT = "${personal.defaultLocale}";
    LC_MONETARY = "${personal.defaultLocale}";
    LC_NAME = "${personal.defaultLocale}";
    LC_NUMERIC = "${personal.defaultLocale}";
    LC_PAPER = "${personal.defaultLocale}";
    LC_TELEPHONE = "${personal.defaultLocale}";
    LC_TIME = "${personal.defaultLocale}";
  };
}
