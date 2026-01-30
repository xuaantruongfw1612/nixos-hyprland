{ config, pkgs, lib, ... }:
let
  # Choice scheme: "ocean" | "green" | "red" | "pink" | "purple" | "white"
  activeScheme = "white";  
  
  colorSchemes = {
    white = {
      base = "rgba(10, 22, 40, 0.85)";   
      text = "#FFFFFF"; 
      mauve = "#FFFFFF";  
      surface2 = "#FFFFFF"; 
      red = "#FFFFFF";  
      teal = "#FFFFFF"; 
    };

    ocean = {
      base = "rgba(10, 22, 40, 0.85)";   
      text = "#FFFFFF"; 
      mauve = "#00E5FF";  
      surface2 = "rgba(0, 229, 255, 0.2)"; 
      red = "#FF3D71";  
      teal = "#00FFF0"; 
    };
    
    green = {
      base = "rgba(10, 20, 16, 0.85)";
      text = "#FFFFFF";
      mauve = "#00FF88"; 
      surface2 = "rgba(0, 255, 136, 0.2)";
      red = "#FF5252";
      teal = "#39FF14"; 
    };
    
    red = {
      base = "rgba(26, 10, 10, 0.85)";
      text = "#FFFFFF";
      mauve = "#FF0066"; 
      surface2 = "rgba(255, 0, 102, 0.2)";
      red = "#FF1744";
      teal = "#FF6B9D";   
    };
    
    pink = {
      base = "rgba(26, 10, 20, 0.85)";
      text = "#FFFFFF";
      mauve = "#FF1493";   
      surface2 = "rgba(255, 20, 147, 0.2)";
      red = "#FF4081";
      teal = "#FF69B4"; 
    };
    
    purple = {
      base = "rgba(15, 10, 26, 0.85)";
      text = "#FFFFFF";
      mauve = "#BB86FC";
      surface2 = "rgba(187, 134, 252, 0.2)";
      red = "#FF4081";
      teal = "#E040FB";
    };
  };
  
  colors = colorSchemes.${activeScheme};
  
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      ScreenWidth = "1920";
      ScreenHeight = "1080";
      
      Font = "JetBrainsMono Nerd Font";
      FontSize = "13";
      
      RoundCorners = "20";
      
      Background = "${./video/huntshowdown.mp4}"; 
      
      BackgroundSpeed = "1.0";
      PauseBackground = "";
      CropBackground = "false";
      BackgroundHorizontalAlignment = "center";
      BackgroundVerticalAlignment = "center";
      DimBackground = "0.3";  
      
      # Text Colors 
      HeaderTextColor = "${colors.text}";
      DateTextColor = "${colors.text}";
      TimeTextColor = "${colors.text}";
      
      # Background Colors 
      FormBackgroundColor = "${colors.base}";
      BackgroundColor = "${colors.base}";
      DimBackgroundColor = "${colors.base}";
      
      # Login Fields 
      LoginFieldBackgroundColor = "${colors.base}";
      PasswordFieldBackgroundColor = "${colors.base}";
      LoginFieldTextColor = "${colors.mauve}"; 
      PasswordFieldTextColor = "${colors.mauve}";
      
      # Icons 
      UserIconColor = "${colors.mauve}";
      PasswordIconColor = "${colors.mauve}";
      
      # Placeholder
      PlaceholderTextColor = "${colors.surface2}";
      WarningColor = "${colors.red}";
      
      # Buttons 
      LoginButtonTextColor = "${colors.mauve}";
      LoginButtonBackgroundColor = "${colors.base}";
      SystemButtonsIconsColor = "${colors.mauve}";
      SessionButtonTextColor = "${colors.mauve}";
      VirtualKeyboardButtonTextColor = "${colors.mauve}";
      
      # Dropdown
      DropdownTextColor = "${colors.mauve}";
      DropdownSelectedBackgroundColor = "${colors.base}";
      DropdownBackgroundColor = "${colors.base}";
      
      # Highlight
      HighlightTextColor = "#FFFFFF";
      HighlightBackgroundColor = "${colors.mauve}";
      HighlightBorderColor = "${colors.mauve}";
      
      # Hover States 
      HoverUserIconColor = "${colors.teal}";
      HoverPasswordIconColor = "${colors.teal}";
      HoverSystemButtonsIconsColor = "${colors.teal}";
      HoverSessionButtonTextColor = "${colors.teal}";
      HoverVirtualKeyboardButtonTextColor = "${colors.teal}";
      
      # Blur Effects
      PartialBlur = "true";
      BlurMax = "20";
      Blur = "2.2";
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
