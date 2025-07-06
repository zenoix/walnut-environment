{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  options = {
    walnut.sops.enable = lib.mkEnableOption "enable sops-nix";
  };

  config = lib.mkIf config.walnut.sops.enable {

    sops = {
      defaultSopsFile = ../../secrets.yaml;
      validateSopsFiles = false;

      age = {
        # automatically import host SSH keys as age keys
        sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        # this will use an age key that is expected to already be in the filesystem
        keyFile = "/var/lib/sops-nix/key.txt";
        # generate a new key if the key specified above does not exist
        generateKey = true;
      };

      # secrets will be output to /run/secrets
      # e.g. /run/secrets/foo
      # secrets required for user creation are handled in respective ./user/<username>.nix files
      # because they will be output to /run/secrets-for-users and only when the user is assigned to a host
      secrets = { };
    };
  };

}
