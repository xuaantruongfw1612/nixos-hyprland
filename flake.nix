{
  description = "Truong's NixOS: Seamlessly switching between Minimal focus and Full power";

  inputs = {
    full-config.url = "path:./full";
    # full-config.url = "path:./minimal";
  };

  outputs =
    { self, full-config, ... }:
    {
      nixosConfigurations = full-config.nixosConfigurations;

      formatter = full-config.formatter;
    };
}
