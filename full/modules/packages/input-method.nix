{ pkgs, config, inputs, ... }: {
  
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-bamboo     # engine tiếng Việt
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    kdePackages.fcitx5-configtool
  ];

  # imports = [
  #   inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
  # ];
  #
  # services.fcitx5-lotus = {
  #   enable = true;
  #   user = "truong";
  # };
}
