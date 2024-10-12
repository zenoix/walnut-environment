{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnut.neovim.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.walnut.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      package = pkgs-unstable.neovim-unwrapped;
    };
  };
}
