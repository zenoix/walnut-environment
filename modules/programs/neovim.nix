{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    neovim.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      package = pkgs-unstable.neovim-unwrapped;
    };
  };
}
