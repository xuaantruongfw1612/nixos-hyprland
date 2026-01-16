{ config, pkgs, lib, ... }:

let
  base = "#0a0a0a"; 
  text = "#eeeeee";  
  mauve = "#b30000"; 
  surface2 = "#4d0000"; 
  red = "#ff0000"; 
  teal = "#ff4d4d"; 

  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      ScreenWidth = "1920";
      ScreenHeight = "1080";
      
      Font = "JetBrainsMono Nerd Font";
      FontSize = "12";
      
      RoundCorners = "20";
      
      Background = "${./video/kira-death-note-moewalls-com.mp4}"; 
      
      BackgroundSpeed = "1.0";
      PauseBackground = "";
      CropBackground = "false";
      BackgroundHorizontalAlignment = "center";
      BackgroundVerticalAlignment = "center";
      DimBackground = "0.0";

      HeaderTextColor = "${text}";
      DateTextColor = "${text}";
      TimeTextColor = "${text}";
      FormBackgroundColor = "${base}";
      BackgroundColor = "${base}";
      DimBackgroundColor = "${base}";
      LoginFieldBackgroundColor = "${base}";
      PasswordFieldBackgroundColor = "${base}";
      LoginFieldTextColor = "${mauve}";
      PasswordFieldTextColor = "${mauve}"; 
      UserIconColor = "${mauve}";
      PasswordIconColor = "${mauve}";
      PlaceholderTextColor = "${surface2}";
      WarningColor = "${red}";
      LoginButtonTextColor = "${mauve}";
      LoginButtonBackgroundColor = "${base}";
      SystemButtonsIconsColor = "${mauve}";
      SessionButtonTextColor = "${mauve}";
      VirtualKeyboardButtonTextColor = "${mauve}";
      DropdownTextColor = "${mauve}";
      DropdownSelectedBackgroundColor = "${base}";
      DropdownBackgroundColor = "${base}";
      HighlightTextColor = "${mauve}";
      HighlightBackgroundColor = "${mauve}";
      HighlightBorderColor = "${mauve}";
      HoverUserIconColor = "${teal}";
      HoverPasswordIconColor = "${teal}";
      HoverSystemButtonsIconsColor = "${teal}";
      HoverSessionButtonTextColor = "${teal}";
      HoverVirtualKeyboardButtonTextColor = "${teal}";

      PartialBlur = "true";
      BlurMax = "35";
      Blur = "2.0";
      HaveFormBackground = "false";
      FormPosition = "left";
    };
  };

in {
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "weston";
    };
    autoNumlock = true;
    package = pkgs.kdePackages.sddm;
    enableHidpi = true;
    theme = "sddm-astronaut-theme";

    extraPackages = [
      custom-sddm-astronaut
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtvirtualkeyboard
      pkgs.kdePackages.qtmultimedia
    ];

    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
  };

  environment.systemPackages = [
    custom-sddm-astronaut
    pkgs.bibata-cursors
  ];
}
