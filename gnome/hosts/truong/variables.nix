{ ... }:

{
  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "gnome-terminal";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
