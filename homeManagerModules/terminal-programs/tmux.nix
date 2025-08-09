{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.tmux = {
      enable = lib.mkEnableOption "enable tmux";
      sessionizerDirectories = lib.mkOption {
        description = "The full path directories that tmux-sessionizer should look inside of";
        default = null;
        type = with lib.types; nullOr (listOf str);
      };
    };
  };

  config =
    let
      sessionizerDirectories = config.walnutHome.tmux.sessionizerDirectories;
    in
    lib.mkIf config.walnutHome.tmux.enable {
      programs.tmux = {
        enable = true;

        baseIndex = 1;
        escapeTime = 0;
        keyMode = "vi";
        mouse = true;
        shortcut = "Space";
        terminal = "tmux-256color";

        extraConfig = ''
          bind | split-window -h
          bind - split-window -v
          unbind '"'
          unbind %
          bind '"' split-window -v -c "#{pane_current_path}"
          bind % split-window -h -c "#{pane_current_path}"

          bind g display-popup \
            -d "#{pane_current_path}" \
            -w 75% \
            -h 75%

          bind C-n display-popup \
            -h 5 \
            -T "Create New Tmux Session" \
            -E 'bash -i -c "read -p \"Name: \" name; tmux new-session -d -s \$name && tmux switch-client -t \$name"'

          bind C-j display-popup  \
            -w 80% \
            -T "Switch to Tmux Session" \
            -E "tmux list-sessions | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --no-multi --border=none --height 100% --reverse | sed -E 's/:.*$//' | xargs tmux switch-client -t"

          set -g allow-passthrough on
          set -ga update-environment TERM
          set -ga update-environment TERM_PROGRAM

          set -g history-limit 10000

          set -g default-command "$SHELL"

          set -sg terminal-overrides ",*:RGB"

          set -g renumber-windows on

          # status left look and feel
          set -g status-left-length 100
          set -g status-left ""
          set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_mauve},fg=#{@thm_mantle},bold]  #S },#{#[bg=default,fg=#{@thm_blue}]  #S }}"
          set -ga status-left "#[bg=default,fg=#{@thm_mauve},none]│"
          set -ga status-left "#[bg=default,fg=#{@thm_blue}]  #{pane_current_command} "
          set -ga status-left "#[bg=default,fg=#{@thm_mauve},none]│"
          set -ga status-left "#[bg=default,fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "

          # status right look and feel
          set -g status-right-length 100
          set -g status-right ""
          set -ga status-right "#[bg=default,fg=#{@thm_blue}] 󰭦 %Y-%m-%d "
          set -ga status-right "#[bg=default,fg=#{@thm_mauve},none]│"
          set -ga status-right "#[bg=default,fg=#{@thm_blue}] 󰅐 %H:%M "

          # Configure Tmux
          set -g status-position top
          set -g status-style "bg=default"
          set -g status-justify "absolute-centre"

          # pane border look and feel
          setw -g pane-border-status top
          setw -g pane-border-format ""
          setw -g pane-active-border-style "bg=default,fg=#{@thm_overlay_0}"
          setw -g pane-border-style "bg=default,fg=#{@thm_surface_0}"
          setw -g pane-border-lines heavy

          # popup border
          set -g popup-border-style "bg=default,fg=#{@thm_mauve}"
          set -g popup-border-lines rounded
        '';

        plugins = with pkgs-unstable; [
          tmuxPlugins.vim-tmux-navigator
          {
            plugin = tmuxPlugins.catppuccin;
            extraConfig = ''
              # Configure Catppuccin
              set -g @catppuccin_status_background "none"
              set -g @catppuccin_window_status_style "none"
              set -g @catppuccin_pane_status_enabled "off"
              set -g @catppuccin_pane_border_status "off"



              # window style
              set -wg automatic-rename on
              set -g automatic-rename-format ""
              set -g window-status-separator '|'
              set -g status-justify 'absolute-centre'
              set -g @catppuccin_window_status_style 'custom'
              set -g @catppuccin_window_flags "icon"
              set -g @catppuccin_window_flags_icon_last ""
              set -g @catppuccin_window_flags_icon_current ""
              set -g @catppuccin_window_flags_icon_zoom " 󰁌"
              set -g @catppuccin_window_flags_icon_mark ""
              set -g @catppuccin_window_flags_icon_silent ""
              set -g @catppuccin_window_flags_icon_activity ""
              set -g @catppuccin_window_flags_icon_bell ""
              set -g @catppuccin_window_number ""
              set -g @catppuccin_window_text "#[fg=default,bg=default] #I#{?#{!=:#{window_name},},: #W,}"
              set -g @catppuccin_window_current_number ""
              set -g @catppuccin_window_current_text "#[fg=#{@thm_mantle},bg=#{@thm_mauve}] #I#{?#{!=:#{window_name},},: #W,}"
            ''
            + (
              if (sessionizerDirectories != null) then
                ''
                  bind -r f display-popup  \
                    -w 80% \
                    -T "Tmux Sessionizer" \
                    -E "~/bin/tmux-sessionizer.sh"
                ''
              else
                ''''
            );
          }
        ];
      };

      home.file = lib.mkIf (sessionizerDirectories != null) {
        tmux-sessionizer = {
          enable = true;
          executable = true;
          target = "bin/tmux-sessionizer.sh";
          text = ''
            #!/usr/bin/env bash

            if [[ $# -eq 1 ]]; then
                selected=$1
            else
                selected=$(find ${lib.strings.concatStringsSep " " config.walnutHome.tmux.sessionizerDirectories} -mindepth 1 -maxdepth 1 -type d -not -path "*/.*" | sed "s|^$HOME|~|" | fzf --no-multi --border=none --height 100% --layout=reverse | sed "s|^~|$HOME|")
            fi

            if [[ -z $selected ]]; then
                exit 0
            fi

            selected_name=$(basename "$selected" | tr . _)
            tmux_running=$(pgrep tmux)

            if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
                tmux new-session -s $selected_name -c $selected
                exit 0
            fi

            if ! tmux has-session -t=$selected_name 2> /dev/null; then
                tmux new-session -ds $selected_name -c $selected
            fi

            if [[ -z $TMUX ]]; then
                tmux attach -t $selected_name
            else
                tmux switch-client -t $selected_name
            fi
          '';
        };
      };
    };
}
