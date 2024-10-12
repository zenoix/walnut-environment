{
  inputs,
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  imports = [
    ./autocmds.nix
    ./opts.nix
    ./remap.nix
    ./theme.nix

    ./plugins/plugins-bundle.nix
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
      package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.neovim-unwrapped;

      extraPackages = with pkgs-unstable; [ astro-language-server ];
    };
  };
}
