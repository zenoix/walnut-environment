{
  inputs,
  personal,
  lib,
  config,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options = {
    walnut.sops.enable = lib.mkEnableOption "enable sops";
  };

  config = lib.mkIf config.walnut.sops.enable {
    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      validateSopsFiles = false;

      age = {
        # Automatically import host SSH keys as age keys
        sshKeyPaths = [ ];
        # This will use an age key that is already expected to exist in the filesystem
        keyFile = "/var/lib/sops-nix/key.txt";
        # Generate a new key if the key specified above does not exist
        generateKey = true;
      };

      # secrets will be output to /run/secrets
      # secrets require for user creation are handled in respective ./users/<username>/nix files
      # because they will be output to /run/secrets-for-users and only when the user is assigned to a host
      secrets = {
        "user-passwords/walnut" = { };
        "user-passwords/zenoix" = { };
      };
    };
  };
}
