{ pkgs, ... }: {
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

  environment.systemPackages = with pkgs; [
    qt6Packages.fcitx5-configtool
  ];
}
