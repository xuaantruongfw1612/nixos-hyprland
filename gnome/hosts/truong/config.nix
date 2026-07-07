{
  config,
  pkgs,
  lib,
  inputs,
  username,
  host,
  ...
}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = host;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  # glibc chỉ liệt kê locale tiếng Việt dưới dạng "vi_VN/UTF-8" (không có
  # ".UTF-8" trong tên) - khai rõ để tránh lỗi "unsupported locales detected"
  i18n.extraLocales = [
    "vi_VN/UTF-8"
  ];

  # LƯU Ý: dùng "vi_VN" (không có ".UTF-8") vì glibc chỉ liệt kê locale này
  # dưới dạng "vi_VN/UTF-8" trong file SUPPORTED. Nếu để "vi_VN.UTF-8", NixOS
  # tự sinh ra chuỗi "vi_VN.UTF-8/UTF-8" không khớp, gây lỗi build
  # "unsupported locales detected". Giá trị "vi_VN" vẫn dùng bảng mã UTF-8.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  console.keyMap = "us";

  system.stateVersion = "25.11";
}
