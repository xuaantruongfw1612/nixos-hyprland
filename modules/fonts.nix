{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      inter                
      noto-fonts          
      noto-fonts-cjk-sans
      noto-fonts-color-emoji 

      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only   

      font-awesome             
      material-design-icons   

      minecraftia          
      victor-mono          
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Noto Color Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
