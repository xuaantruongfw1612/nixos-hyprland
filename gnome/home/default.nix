{ pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    ripgrep
    fd
    btop
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "truong";
      email = "truong@example.com";
    };
  };

  programs.home-manager.enable = true;

  # --- THÊM PHẦN NÀY ĐỂ TỰ ĐỘNG ÁP DỤNG THEME MACOS ---
  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Dark"; # Theme nền tối chuẩn Apple
      package = pkgs.whitesur-gtk-theme;
    };
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
    cursorTheme = {
      name = "macOS"; 
      package = pkgs.apple-cursor;
    };
  };
  # Hack ép các app lõi của GNOME (Libadwaita) dùng theme WhiteSur
  xdg.configFile = {
    "gtk-4.0/assets".source = "${pkgs.whitesur-gtk-theme}/share/themes/WhiteSur-Dark/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${pkgs.whitesur-gtk-theme}/share/themes/WhiteSur-Dark/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${pkgs.whitesur-gtk-theme}/share/themes/WhiteSur-Dark/gtk-4.0/gtk-dark.css";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-format = "24h";
    };
    "org/gnome/shell" = {
      # Bật tự động các Extension macOS
      disable-user-extensions = false;
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "blur-my-shell@aunetx"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "compiz-alike-magic-lamp-effect@hermes83.github.com"
        "just-perfection-desktop@just-perfection"
      ];
      # App mặc định trên thanh Dock của bạn
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "code.desktop"
      ];
    };
  };
}