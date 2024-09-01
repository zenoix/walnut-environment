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

    # Stylix neovim theme seems broken
    colorschemes.catppuccin.enable = true;
  };
}
