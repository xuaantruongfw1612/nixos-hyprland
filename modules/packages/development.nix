{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Build Tools
    gcc
    gnumake
    clang
    cmake
    cargo
    
    # Lua
    lua5_1
    luajit
    luarocks
    
    # Version Control
    git
    lazygit
    
    # Container & Docker
    distrobox
    lazydocker
    
    # Package Manager
    nh
    
    # Code Formatting
    alejandra
    
    # API & Network Tools
    curl
    wget
    socat
    
    # Libraries
    openssl
    glib
  ];
}
