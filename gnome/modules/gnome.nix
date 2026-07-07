{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-photos
    gnome-connections
    epiphany
    geary
    totem
  ];

  services.gnome.gnome-browser-connector.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];

  programs.dconf.enable = true;

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  services.printing.enable = true;

  # --- THÊM PHẦN NÀY ĐỂ CÀI THEME & EXTENSION MACOS ---
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager # <--- Thêm app quản lý xịn hơn
    gnome-shell-extensions  # <--- Thêm gói chính thức chứa User Themes
    
    # Theme macOS
    whitesur-gtk-theme
    whitesur-icon-theme
    apple-cursor
    
    # Tiện ích mở rộng
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes
    gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.search-light
    gnomeExtensions.dash2dock-lite
    gnomeExtensions.coverflow-alt-tab
    gnomeExtensions.just-perfection
  ];
}