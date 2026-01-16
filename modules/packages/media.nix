{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Video Players
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    vlc
    
    # Video Tools
    ffmpeg
    yt-dlp
    
    # Image Tools
    imagemagick
    
    # Recording
    obs-studio
  ];
}
