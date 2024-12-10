{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    prefix = "C-s";
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = catppuccin;
        extraConfig = ''
                   
                    set -g @tokyo-night-tmux_theme "storm"    # storm | night | day
                    set -g @tokyo-night-tmux_window_id_style "digital"
                    set -g @tokyo-night-tmux_pane_id_style "hsquare"
                    set -g @tokyo-night-tmux_zoom_id_style "dsquare"
                    set -g @tokyo-night-tmux_show_datetime 1
                    set -g @tokyo-night-tmux_date_format "DMY"
                    set -g @tokyo-night-tmux_time_format "24H"
        '';
      }
    ];

    extraConfig = ''
      set-option -sa terminal-features ',xterm-256color:RGB'
      set -g mouse on
      
      # Vim-style pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Open splits in current directory
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "config reloaded..."
    '';
  };
}
