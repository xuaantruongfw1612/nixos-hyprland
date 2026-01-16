{ pkgs, inputs, host, ... }: {
  imports = [
    ./packages/hyprland.nix
    ./packages/input-method.nix
    ./packages/programs.nix
    ./packages/development.nix
    ./packages/apps.nix
    ./packages/utils.nix
    ./packages/hardware.nix
    ./packages/media.nix
    ./packages/scripts.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    JAKOS_NIXOS_VERSION = "0.0.5";
    JAKOS = "true";
    
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx"; 
  };
}
