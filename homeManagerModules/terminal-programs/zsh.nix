{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.zsh.enable = lib.mkEnableOption "enable zsh";
  };

  config = lib.mkIf config.walnutHome.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        append = true;
        save = 10000;
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
        expireDuplicatesFirst = true;
        ignoreDups = true;
        ignoreSpace = true;
        share = true;
      };

      completionInit = ''
        autoload -Uz compinit && compinit
        autoload -Uz bashcompinit && bashcompinit
        zstyle :compinstall filename "$HOME/.zshrc"
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' menu select
        zstyle -e ':completion:*:default' list-colors 'reply=("''${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:''${(s.:.)LS_COLORS}")'
        setopt auto_menu menu_complete
        setopt no_case_glob no_case_match
      '';

      initContent = ''
        unsetopt beep
        setopt interactive_comments

        autoload -Uz is-at-least

        source ${pkgs.fzf-git-sh}/share/fzf-git-sh/fzf-git.sh

        function git_current_branch() {
            local ref
            ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
            local ret=$?
            if [[ $ret != 0 ]]; then
                [[ $ret == 128 ]] && return  # no git repo.
                ref=$(git rev-parse --short HEAD 2> /dev/null) || return
            fi
            echo ''${ref#refs/heads/}
        }

        function git_current_user_name() {
            __git_prompt_git config user.name 2>/dev/null
        }

        function git_current_user_email() {
            __git_prompt_git config user.email 2>/dev/null
        }

        function git_repo_name() {
            local repo_path
            if repo_path="$(git rev-parse --show-toplevel 2>/dev/null)" && [[ -n "$repo_path" ]]; then
                echo ''${repo_path:t}
            fi
        }

        function current_branch() {
            git_current_branch
        }

        function git_develop_branch() {
            command git rev-parse --git-dir &>/dev/null || return
            local branch
            for branch in dev devel develop development; do
                if command git show-ref -q --verify refs/heads/$branch; then
                    echo $branch
                    return 0
                fi
            done

            echo develop
            return 1
        }

        function git_main_branch() {
            command git rev-parse --git-dir &>/dev/null || return
            local ref
            for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,master}; do
                if command git show-ref -q --verify $ref; then
                    echo ''${ref:t}
                    return 0
                fi
            done

            echo master
            return 1
        }

        # mkcd is equivalent to takedir
        function mkcd takedir() {
            mkdir -p $@ && cd ''${@:$#}
        }

        function takeurl() {
            local data thedir
            data="$(mktemp)"
            curl -L "$1" > "$data"
            tar xf "$data"
            thedir="$(tar tf "$data" | head -n 1)"
            rm "$data"
            cd "$thedir"
        }

        function takegit() {
            git clone "$1"
            cd "$(basename ''${1%%.git})"
        }

        function take() {
            if [[ $1 =~ ^(https?|ftp).*\.(tar\.(gz|bz2|xz)|tgz)$ ]]; then
                takeurl "$1"
            elif [[ $1 =~ ^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]; then
                takegit "$1"
            else
                takedir "$@"
            fi
        }

        function detect-clipboard() {
            emulate -L zsh

            if [[ "''${OSTYPE}" == darwin* ]] && (( ''${+commands[pbcopy]} )) && (( ''${+commands[pbpaste]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | pbcopy; }
                function clippaste() { pbpaste; }
            elif [[ "''${OSTYPE}" == (cygwin|msys)* ]]; then
                function clipcopy() { cat "''${1:-/dev/stdin}" > /dev/clipboard; }
                function clippaste() { cat /dev/clipboard; }
            elif (( $+commands[clip.exe] )) && (( $+commands[powershell.exe] )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | clip.exe; }
                function clippaste() { powershell.exe -noprofile -command Get-Clipboard; }
            elif [ -n "''${WAYLAND_DISPLAY:-}" ] && (( ''${+commands[wl-copy]} )) && (( ''${+commands[wl-paste]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | wl-copy &>/dev/null &|; }
                function clippaste() { wl-paste --no-newline; }
            elif [ -n "''${DISPLAY:-}" ] && (( ''${+commands[xsel]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | xsel --clipboard --input; }
                function clippaste() { xsel --clipboard --output; }
            elif [ -n "''${DISPLAY:-}" ] && (( ''${+commands[xclip]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | xclip -selection clipboard -in &>/dev/null &|; }
                function clippaste() { xclip -out -selection clipboard; }
            elif (( ''${+commands[lemonade]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | lemonade copy; }
                function clippaste() { lemonade paste; }
            elif (( ''${+commands[doitclient]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | doitclient wclip; }
                function clippaste() { doitclient wclip -r; }
            elif (( ''${+commands[win32yank]} )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | win32yank -i; }
                function clippaste() { win32yank -o; }
            elif [[ $OSTYPE == linux-android* ]] && (( $+commands[termux-clipboard-set] )); then
                function clipcopy() { cat "''${1:-/dev/stdin}" | termux-clipboard-set; }
                function clippaste() { termux-clipboard-get; }
            elif [ -n "''${TMUX:-}" ] && (( ''${+commands[tmux]} )); then
                function clipcopy() { tmux load-buffer "''${1:--}"; }
                function clippaste() { tmux save-buffer -; }
            else
                function _retry_clipboard_detection_or_fail() {
                    local clipcmd="''${1}"; shift
                    if detect-clipboard; then
                        "''${clipcmd}" "$@"
                    else
                        print "''${clipcmd}: Platform $OSTYPE not supported or xclip/xsel not installed" >&2
                        return 1
                    fi
                }
                function clipcopy() { _retry_clipboard_detection_or_fail clipcopy "$@"; }
                function clippaste() { _retry_clipboard_detection_or_fail clippaste "$@"; }
                return 1
            fi
        }

        function clipcopy clippaste {
            unfunction clipcopy clippaste
            detect-clipboard || true # let one retry
            "$0" "$@"
        }


        function copypath {
            # If no argument passed, use current directory
            local file="''${1:-.}"

            # If argument is not an absolute path, prepend $PWD
            [[ $file = /* ]] || file="$PWD/$file"

            # Copy the absolute path without resolving symlinks
            # If clipcopy fails, exit the function with an error
            print -n "''${file:a}" | clipcopy || return 1

            echo ''${(%):-"%B''${file:a}%b copied to clipboard."}
        }


        function copyfile {
            emulate -L zsh
            clipcopy $1
        }

        zle-line-init() {
          emulate -L zsh

          [[ $CONTEXT == start ]] || return 0

          while true; do
            zle .recursive-edit
            local -i ret=$?
            [[ $ret == 0 && $KEYS == $'\4' ]] || break
            [[ -o ignore_eof ]] || exit 0
          done

          local saved_prompt=$PROMPT
          local saved_rprompt=$RPROMPT

          # Set prompt value from character module
          PROMPT="$(starship module -s ''${STARSHIP_CMD_STATUS:-0} character)"
          RPROMPT='''
          zle .reset-prompt
          PROMPT=$saved_prompt
          RPROMPT=$saved_rprompt

          if (( ret )); then
            zle .send-break
          else
            zle .accept-line
          fi
          return ret
        }

        zle -N zle-line-init
      '';
    };
  };
}
