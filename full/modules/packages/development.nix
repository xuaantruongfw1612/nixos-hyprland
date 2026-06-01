{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Build Tools
    gcc
    gnumake
    clang
    clang-tools
    cmake
    cargo
    rustc
    jdk
    jdt-language-server

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

    nodejs
    vtsls # LSP for JS/TS
    nodePackages.browser-sync
    nixfmt-rfc-style
    lua-language-server
    nixd
    rust-analyzer
    rustfmt
    stylua
    maven
    cloudflared
    mariadb
  ];
}
