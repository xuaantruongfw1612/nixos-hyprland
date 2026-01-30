{ pkgs, inputs, ... }: {
  services.power-profiles-daemon.enable = true;

  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
    hyprlock.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Hyprland Core
    hypridle
    hyprpolkitagent
    pyprland
    hyprlang
    hyprshot
    hyprcursor
    hyprland-qt-support

    # Display & Wayland
    mesa
    nwg-displays
    nwg-look
    waypaper
    waybar
    wdisplays
    wl-clipboard
    wlr-randr
    wlogout
    swww
    
    # Screenshot & Screen tools
    grim
    grimblast
    slurp
    swappy

    foot

    # Notification & System
    swaynotificationcenter
    
    (rofi.override {
            plugins = [ rofi-calc ];
        })

    # AGS & Quickshell
    (inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default)
    (inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.default)
    
    # XDG
    xdg-user-dirs
  ];
}
