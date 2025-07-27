{
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.tmux.enable = lib.mkEnableOption "enable tmux";
  };

  config = lib.mkIf config.walnutHome.tmux.enable {
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

        set -g allow-passthrough on

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
          '';
        }
      ];
    };
  };
}
