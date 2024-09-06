{ inputs, pkgs, ... }:
{
  imports = [
    ./autocmds.nix
    ./opts.nix
    ./remap.nix

    ./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.neovim-unwrapped;
  };
}
