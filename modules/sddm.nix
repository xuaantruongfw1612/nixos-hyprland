{ pkgs, ... }: 

let
  # Đóng gói theme từ thư mục nằm cùng cấp với file này
  myCustomTheme = pkgs.stdenv.mkDerivation {
    name = "simple-sddm-2";
    src = ./home/simple-sddm-2; # Đường dẫn trỏ tới folder theme
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -r $src $out/share/sddm/themes/simple-sddm-2
    '';
  };
in
{
  # 1. Tắt Ly (để chắc chắn không bị xung đột)
  services.displayManager.ly.enable = false;

  # 2. Bật SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Bắt buộc cho Hyprland
    theme = "simple-sddm-2";
  };

  # 3. Cài gói theme tự tạo và các thư viện QT cần thiết
  environment.systemPackages = with pkgs; [
    myCustomTheme
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
  ];
}
