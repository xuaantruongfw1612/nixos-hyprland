{ pkgs, ... }:
{
  virtualisation.docker.enable = true;

  users.users."truong".extraGroups = [ "docker" ];

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
    vtsls
    nodePackages.browser-sync
    nixfmt-rfc-style
    lua-language-server
    nixd
    rust-analyzer
    rustfmt
    stylua
    nodePackages.prettier
    maven
    cloudflared
    mariadb

    # C#
    omnisharp-roslyn
    csharpier
    dotnet-sdk_8
  ];
}
