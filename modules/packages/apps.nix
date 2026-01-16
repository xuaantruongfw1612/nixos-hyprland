{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # System Utilities
    power-profiles-daemon
    appimage-run
    bc
    brightnessctl
    cpufrequtils
    killall
    pciutils
    unzip
    unrar
    
    # Audio
    pamixer
    pavucontrol
    playerctl
    
    # Clipboard
    cliphist
    
    # Image Viewers
    loupe
    eog
    feh
    
    # Polkit
    kdePackages.polkit-kde-agent-1
    hyprpolkitagent
    
    # Qt/GTK Theming
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    gsettings-qt
    gtk-engine-murrine
    
    # System Notifications
    libnotify
    libappindicator
    
    # File System
    btrfs-progs
    
    # Wallpaper
    wallust
    
    # Misc
    yad
    serie
    findutils
    
    # Fun
    pokemon-colorscripts-mac
  ];
}
