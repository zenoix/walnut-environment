{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  options = {
    walnut-home.sops.enable = lib.mkEnableOption "enable sops";
  };

  config = lib.mkIf config.walnut-home.sops.enable {
    sops = {
      # This is the key that needs to be copied to this location on the host
      age.keyFile = "~/.config/sops/age/keys.txt";

      defaultSopsFile = ../../secrets/secrets.yaml;
      validateSopsFiles = false;

    };
  };
}
