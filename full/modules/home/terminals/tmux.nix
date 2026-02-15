{ pkgs, config, ... }: {
# XuanTruong Config
  home.packages = with pkgs; [
    lazygit
    yazi
    fzf
    bc
    wl-clipboard
  ];

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;
    historyLimit = 10000;
    mouse = true;
    escapeTime = 0;
    
    sensibleOnTop = true; 

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      sensible
      catppuccin
      
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-capture-pane-contents 'on'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
    ];

    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -g renumber-windows on

      # Image preview support (Yazi)
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      
      # -- Prefix Configuration --
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix
      
      # -- Keybindings --
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"
      
      # Window & Split
      bind c new-window -c '#{pane_current_path}'
      bind -n M-Tab new-window
      bind -n C-Tab next-window
      bind -n C-S-Tab previous-window
      
      unbind %
      bind '|' split-window -h -c '#{pane_current_path}'
      bind '\' split-window -fh -c '#{pane_current_path}'
      
      unbind '"'
      bind '-' split-window -v -c '#{pane_current_path}'
      bind '_' split-window -fv -c '#{pane_current_path}'
      
      # Resize & Kill
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r h resize-pane -L 5
      bind -r l resize-pane -R 5
      bind -r m resize-pane -Z
      bind x kill-pane
      
      # Copy Mode (Vi)
      set-window-option -g mode-keys vi
      bind [ display-message "Vi Mode" \; copy-mode
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection
      unbind -T copy-mode-vi MouseDragEnd1Pane
      
      # -- POPUPS --
      bind C-g display-popup -d "#{pane_current_path}" -w 90% -h 90% -E "lazygit"
      bind C-y display-popup -d "#{pane_current_path}" -w 90% -h 90% -E "yazi"
      bind C-t display-popup -d "#{pane_current_path}" -w 80% -h 80% -E "zsh"
      
      # Session Manager
      bind C-j display-popup -E "\
          tmux list-sessions -F '#{?session_attached,,#{session_name}}' |\
          sed '/^$/d' |\
          fzf --reverse --header 'Jump to Session' |\
          xargs tmux switch-client -t"
      
      # Quick New Session
      bind C-n display-popup -E "\
          bash -i -c 'read -p \"New Session Name: \" name; \
          tmux new-session -d -s \$name && tmux switch-client -t \$name'"
      
      # -- THEME --
      %hidden THM_RED="#f89aad"
      %hidden THM_YELLOW="#f9e2af"
      %hidden THM_CRUST="#11111b"
      %hidden THM_FG="#ffffff"
      %hidden THM_MANTLE="#181825"
      
      set -g status-position bottom
      set -g status-bg default
      set -g status-style fg=default,bg=default
      set -g status-interval 60
      set -g status-left-length 60
      set -g status-right-length 100
      
      set -g status-left "#[bg=$THM_RED,fg=$THM_CRUST]#[reverse]█#[noreverse]#S "
      
      set -g status-right "#(bash ${config.home.homeDirectory}/.config/nvim/tmux/random-note.sh) #[bg=$THM_YELLOW,fg=$THM_CRUST]#[reverse]#[noreverse]󰅐 #[fg=$THM_FG,bg=$THM_MANTLE] %I:%M %p #[bg=$THM_YELLOW,fg=$THM_CRUST]#[reverse]#[noreverse]󰃭 #[fg=$THM_FG,bg=$THM_MANTLE] %d/%m/%y"
    '';
  };
}
