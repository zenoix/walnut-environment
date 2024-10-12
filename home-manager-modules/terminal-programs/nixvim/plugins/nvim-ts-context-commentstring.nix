{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.nvim-ts-context-commentstring
    ];
  };
}
