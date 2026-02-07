{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Build Tools
    gcc
    gnumake
    clang
    clang-tools
    cmake
    cargo
    rustc

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
    nixfmt-rfc-style
    lua-language-server
    nixd
    rust-analyzer
    rustfmt
    stylua
  ];
}
