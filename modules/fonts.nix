{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      
      jetbrains-mono
      fira-code
      
      font-awesome
      material-icons
      
      noto-fonts-color-emoji
      
      noto-fonts-cjk-sans
      
      powerline-fonts
    ];
    
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" "Fira Code" ];
        sansSerif = [ "Noto Sans CJK" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
