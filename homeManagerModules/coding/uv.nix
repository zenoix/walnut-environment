{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.uv.enable = lib.mkEnableOption "enable uv";
  };

  config = lib.mkIf config.walnutHome.uv.enable {
    home.packages = with pkgs; [ uv ];

    programs.zsh.initContent = ''eval "$(uv generate-shell-completion zsh)"'';
  };
}
