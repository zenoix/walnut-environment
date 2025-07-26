{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  imports = [
    ./autocmds.nix
    ./badChars.nix
    ./highlights.nix
    ./opts.nix
    ./remap.nix
    ./theme.nix

    ./plugins
  ];

  options = {
    walnutHome.nixvim.enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf config.walnutHome.nixvim.enable {
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
