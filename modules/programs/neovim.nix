{
  pkgs,
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
      package = pkgs.neovim-unwrapped;
    };
  };
}
