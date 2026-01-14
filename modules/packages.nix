{ pkgs
, inputs
, host
, ...
}: {

  services.power-profiles-daemon.enable = true;

  # --- CẤU HÌNH BỘ GÕ (ĐÃ SỬA LỖI PACKAGE & CONFIG) ---
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      # Bắt buộc bật dòng này cho Hyprland
      waylandFrontend = true;
      addons = with pkgs; [
        qt6Packages.fcitx5-unikey  # Dùng đúng gói qt6 theo yêu cầu của Nix
        fcitx5-gtk                 # Hỗ trợ app GTK
      ];
    };
  };
  # ----------------------------------------------------

  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    zsh.enable = true;
    firefox.enable = false;
    waybar.enable = false;
    hyprlock.enable = true;
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

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
    onefetch
    atop

    # Update flake script
    (pkgs.writeShellScriptBin "update" ''
      cd ~/NixOS-Hyprland
      nh os switch -u -H ${host} .
    '')

    # Rebuild flake script
    (pkgs.writeShellScriptBin "rebuild" ''
      cd ~/NixOS-Hyprland
      nh os switch -H ${host} .
    '')

    # Clean up old generations
    (pkgs.writeShellScriptBin "ncg" ''
      nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot
    '')

    # Hyprland Stuff
    hypridle
    hyprpolkitagent
    pyprland
    hyprlang
    hyprshot
    hyprcursor
    mesa
    nwg-displays
    nwg-look
    waypaper
    waybar
    hyprland-qt-support

    # Apps
    power-profiles-daemon
    loupe
    appimage-run
    bc
    brightnessctl
    (btop.override {
      cudaSupport = true;
      rocmSupport = true;
    })
    bottom
    baobab
    btrfs-progs
    cmatrix
    distrobox
    dua
    duf
    cava
    cargo
    clang
    cmake
    cliphist
    cpufrequtils
    curl
    dysk
    eog
    eza
    findutils
    figlet
    ffmpeg
    fd
    feh
    file-roller
    glib
    gsettings-qt
    git
    google-chrome
    gnome-system-monitor
    fastfetch
    jq
    gcc
    gnumake
    grim
    grimblast
    gtk-engine-murrine
    inxi
    imagemagick
    killall
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    lazydocker
    lazygit
    libappindicator
    libnotify
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    nvtopPackages.full
    openssl
    pciutils
    networkmanagerapplet
    pamixer
    pavucontrol
    playerctl
    kdePackages.polkit-kde-agent-1
    rofi
    slurp
    swappy
    serie
    swaynotificationcenter
    swww
    unzip
    wallust
    wdisplays
    wl-clipboard
    wlr-randr
    wlogout
    wget
    xarchiver
    yad
    yazi
    yt-dlp

    (inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default)
    (inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.default)

    # Utils
    ctop
    erdtree
    frogmouth
    lstr
    lolcat
    lsd
    macchina
    mcat
    mdcat
    parallel-disk-usage
    pik
    oh-my-posh
    ncdu
    ncftp
    netop
    ripgrep
    socat
    starship
    trippy
    tldr
    tuptime
    ugrep
    unrar
    v4l-utils
    obs-studio
    zoxide

    # Hardware related
    atop
    bandwhich
    caligula
    cpufetch
    cpuid
    cpu-x
    cyme
    gdu
    glances
    gping
    htop
    hyfetch
    ipfetch
    pfetch
    smartmontools
    light
    lm_sensors
    mission-center
    neofetch

    # Development
    luarocks
    nh

    # Internet
    vesktop

    # Virtualization
    virt-viewer
    libvirt

    # Video
    vlc

    # Terminals
    kitty

    # FCITX5 Configuration Tool
    qt6Packages.fcitx5-configtool

    microsoft-edge
    zsh-autosuggestions
    zsh-syntax-highlighting
    pokemon-colorscripts-mac
    
    # hypr
    xdg-user-dirs
    
    # nvim
    lua5_1
    luajit
    luarocks
  ];

  environment.variables = {
    JAKOS_NIXOS_VERSION = "0.0.5";
    JAKOS = "true";
    
    # --- BẮT BUỘC ĐỂ APP NHẬN BỘ GÕ ---
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx"; 
  };
}
