{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      inter                
      noto-fonts          
      noto-fonts-cjk-sans
      noto-fonts-color-emoji 

      jetbrains-mono    
      maple-mono-NF    
      fira-code            
      victor-mono         

      minecraftia        
      font-awesome      
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Noto Color Emoji" ];
        monospace = [ "JetBrains Mono" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
