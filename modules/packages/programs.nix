{ pkgs, ... }: {
  programs = {
    zsh.enable = true;
    firefox.enable = false;
    waybar.enable = false;
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    
    git.enable = true;
    tmux.enable = true;
    nm-applet.indicator = true;
    
    neovim = {
      enable = true;
      defaultEditor = false;
    };

    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];
  };

  environment.systemPackages = with pkgs; [
    # Browsers
    google-chrome
    microsoft-edge
    
    # Terminal
    kitty
    
    # File Management
    file-roller
    xarchiver
    yazi
    
    # System Tools
    gnome-system-monitor
    baobab
    mission-center
    
    # Network
    networkmanagerapplet
    vesktop
    
    # ZSH plugins
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
