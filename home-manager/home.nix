{
  config,
  pkgs,
  personal,
  ...
}:
{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "${personal.user}";
    homeDirectory = "/home/${personal.user}";
    stateVersion = "24.05";

    packages = with pkgs; [
      chafa
      vesktop
    ];
  };

}
