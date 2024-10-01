{ pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";

    defaultOptions = [
      "--border sharp"
      "--prompt '∷ '"
      "--info=inline"
      "--height=70%"
      "--multi"
      "--bind 'ctrl-a:select-all'"
    ];

    changeDirWidgetCommand = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";

    fileWidgetOptions = [
      "--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
      "--bind 'ctrl-p:toggle-preview'"
    ];

    historyWidgetOptions = [ "--layout=reverse" ];

  };

  home.packages = with pkgs; [ fzf-git-sh ];
}
