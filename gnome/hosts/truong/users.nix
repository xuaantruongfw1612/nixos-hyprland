{ pkgs, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "truong";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
    initialPassword = "changeme"; # đổi ngay bằng lệnh `passwd` sau khi cài
  };

  programs.zsh.enable = true;
  security.sudo.wheelNeedsPassword = true;
}
