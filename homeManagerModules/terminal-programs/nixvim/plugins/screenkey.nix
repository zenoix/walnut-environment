{ pkgs, ... }:
{
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "screenkey-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "NStefan002";
        repo = "screenkey.nvim";
        rev = "0589de3c857721e150ea694cfe66d6d0e8aecacb";
        hash = "sha256-RTUkG77gM6b1PKv5AqB0/U4satHwQ+q5kJYM3U/mkAw=";
      };
    })
  ];
}
