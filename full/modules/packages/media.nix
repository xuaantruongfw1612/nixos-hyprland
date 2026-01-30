{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Video Players
    (mpv.override {
      scripts = [ mpvScripts.mpris ];
      extraMakeWrapperArgs = [
        "--add-flags" "--gpu-context=wayland"
      ];
    })
    
    # Video Tools
    ffmpeg
    yt-dlp
    
    # Image Tools
    imagemagick
    
    # Recording
    obs-studio
  ];
}
