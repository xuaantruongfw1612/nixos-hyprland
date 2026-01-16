{ pkgs, host, ... }: {
  environment.systemPackages = with pkgs; [
    # Update flake script
    (pkgs.writeShellScriptBin "update" ''
      cd ~/NixOS-Hyprland
      nh os switch -u -H ${host} .
    '')

    # Rebuild flake script
    (pkgs.writeShellScriptBin "rebuild" ''
      cd ~/NixOS-Hyprland
      nh os switch -H ${host} .
    '')

    # Clean up old generations
    (pkgs.writeShellScriptBin "ncg" ''
      nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot
    '')
  ];
}
