{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    curl
    htop
    unzip
    file

    gnome-tweaks
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator

    firefox
    brave
    vscode
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    font-awesome
    
    # Thêm font Inter (Giống macOS 99%)
    inter 
  ];

  services.flatpak.enable = true;
}
