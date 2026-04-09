{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    throne  # Thay nekoray bằng throne
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ];

  boot.kernelModules = [ "tun" ];

  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
  };
}
