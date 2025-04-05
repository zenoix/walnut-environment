{ pkgs-unstable, lib, ... }:
{
  programs.nixvim.plugins.fzf-lua = {
    enable = true;
    package = pkgs-unstable.vimPlugins.fzf-lua;
    profile = "telescope";
    settings = {
      winopts = {
        preview = {
          default = "bat";
        };
      };

      files = {
        fd_opts = lib.strings.concatStringsSep " " [
          "--color=never" # Never show color
          "--hidden" # Show hidden files
          "--type f" # Find files
          "--type l" # Find symlinks

          # Exclude some patterns from search
          "--exclude .git"
          "--exclude '**/.devbox/*'"
          "--exclude '**/.vscode/*'"
          "--exclude '**/venv/*'"
          "--exclude '**/.venv/*'"
          "--exclude '**/.idea/*'"
          "--exclude '**/.vscode/*'"
          "--exclude '**/build/*'"
          "--exclude '**/dist/*'"
          "--exclude '**/yarn.lock'"
          "--exclude '**/package-lock.json'"

        ];
        follow = true;
      };

      grep = {
        rg_opts = lib.strings.concatStringsSep " " [
          "--column" # Show column numbers
          "--no-heading" # Don't group matches by each file
          "--with-filename" # Print the file path with the matched lines
          "--line-number" # Show line numbers
          "--column" # Show column numbers
          "--smart-case" # Smart case search
          "--color=always" # Always use color

          # Exclude some patternnixs from search
          "--glob=!**/.git/*"
          "--glob=!**/.devbox/*"
          "--glob=!**/.venv/*"
          "--glob=!**/venv/*"
          "--glob=!**/.idea/*"
          "--glob=!**/.vscode/*"
          "--glob=!**/build/*"
          "--glob=!**/dist/*"
          "--glob=!**/yarn.lock"
          "--glob=!**/package-lock.json"

          "-e"
        ];
        follow = true;
        hidden = true;
      };
    };

    keymaps = {
      "<leader>pf" = {
        action = "files";
      };
      "<leader>pb" = {
        action = "buffers";
      };
      "<leader>pd" = {
        action = "diagnostics_workspace";
      };
      "<leader>pg" = {
        action = "live_grep";
      };
    };
  };
}
