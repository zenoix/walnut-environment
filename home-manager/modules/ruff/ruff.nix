{ pkgs, ... }: {
  programs.ruff = {
    enable = true;
    settings = pkgs.lib.importTOML ./ruff.toml;
  };
}
