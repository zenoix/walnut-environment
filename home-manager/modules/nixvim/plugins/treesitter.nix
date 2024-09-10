{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      ensure_installed = [
        "gitignore"
        "python"
        "r"
        "sql"
        "yaml"
        "c"
        "lua"
        "vim"
        "vimdoc"
        "query"
        "sql"
        "julia"
        "go"
      ];
    };

    # TODO: Missing settings in nix 24.05
  };
}
