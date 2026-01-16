{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # System Information
    onefetch
    fastfetch
    neofetch
    hyfetch
    macchina
    ipfetch
    pfetch
    cpufetch
    inxi
    
    # System Monitoring
    (btop.override {
      cudaSupport = true;
      rocmSupport = true;
    })
    bottom
    htop
    glances
    atop
    
    # Disk Usage
    dua
    duf
    dysk
    gdu
    ncdu
    erdtree
    parallel-disk-usage
    
    # File Management
    eza
    lsd
    fd
    ripgrep
    ugrep
    file
    
    # Network
    bandwhich
    gping
    trippy
    ncftp
    netop
    
    # Container & Process
    ctop
    
    # Terminal Enhancements
    starship
    oh-my-posh
    zoxide
    tldr
    
    # Text Processing
    jq
    lolcat
    mcat
    mdcat
    frogmouth
    lstr
    
    # Visualization
    cmatrix
    cava
    figlet
    pik
    
    # Hardware Info
    caligula
    cpuid
    cpu-x
    cyme
    smartmontools
    lm_sensors
    v4l-utils
    
    # Uptime
    tuptime
  ];
}
