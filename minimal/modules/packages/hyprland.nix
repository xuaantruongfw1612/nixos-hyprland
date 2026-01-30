{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    waybar
    swww
    zsh
    rofi
    swaync
    hyprpaper
  ];
}
