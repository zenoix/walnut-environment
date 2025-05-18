{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  imports = [
    ./autocmds.nix
    ./highlights.nix
    ./opts.nix
    ./remap.nix
    ./theme.nix

    ./plugins
  ];

  options = {
    walnut-home.nixvim.enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf config.walnut-home.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      package = pkgs-unstable.neovim-unwrapped;

      extraPackages = with pkgs-unstable; [ ];
    };
  };
}
