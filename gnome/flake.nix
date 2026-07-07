{
  description = "NixOS - GNOME";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      host = "truong";
      username = "truong";
    in
    {
      nixosConfigurations."${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system inputs username host;
        };
        modules = [
          ./hosts/${host}/config.nix
          ./hosts/${host}/hardware.nix
          ./hosts/${host}/users.nix
          ./hosts/${host}/variables.nix
          ./hosts/${host}/packages-fonts.nix

          ./modules/gnome.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-bak";
            home-manager.extraSpecialArgs = {
              inherit inputs system username host;
            };
            home-manager.users.${username} = {
              home.username = username;
              home.homeDirectory = "/home/${username}";
              imports = [ ./home/default.nix ];
            };
          }
        ];
      };
    };
}
