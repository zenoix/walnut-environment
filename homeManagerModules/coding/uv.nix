{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.uv.enable = lib.mkEnableOption "enable uv";
  };

  config = lib.mkIf config.walnut-home.uv.enable {
    home.packages = with pkgs-unstable; [ uv ];

    programs.zsh.initExtra = ''eval "$(uv generate-shell-completion zsh)"'';
  };
}
