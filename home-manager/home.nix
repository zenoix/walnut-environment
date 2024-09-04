{ config, pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "zenoix";
    homeDirectory = "/home/zenoix";
    stateVersion = "24.05";

    packages = with pkgs; [
      chafa
    ];
  };

}
