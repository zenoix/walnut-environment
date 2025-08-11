{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf config.walnutHome.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings =
        (pkgs.lib.importTOML ../../nonNix/starship.toml)
        // (
          if (config.walnutHome.jujutsu.enable) then
            {
              custom.jj = {
                command = "prompt";
                format = "$output";
                ignore_timeout = true;
                shell = [
                  "starship-jj"
                  "--ignore-working-copy"
                  "starship"
                ];
                use_stdin = false;
                when = true;
              };
            }
          else
            { }
        );
    };

    home.packages = lib.mkIf config.walnutHome.jujutsu.enable [
      inputs.starship-jj.packages.${pkgs.system}.starship-jj
    ];
  };
}
