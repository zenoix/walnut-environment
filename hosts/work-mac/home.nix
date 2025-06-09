{
  pkgs,
  lib,
  work,
  ...
}:
{
  imports = [
    ./../common/home.nix
    ./../work-common/home.nix
  ];

  home = {
    homeDirectory = "/Users/${work.user}";

    file = {
      ".config/aerospace/aerospace.toml".source = ../../nonNix/aerospace.toml;
      ".hushlogin".text = "";
    };

    packages = with pkgs; [
      coreutils

    ];
  };

  walnut-home = {
    ghostty.enable = lib.mkForce false;
    kitty.enable = true;
  };

  stylix.opacity.terminal = lib.mkForce 0.97;

  programs.kitty = {
    font = {
      size = lib.mkOverride 30 13;
      name = lib.mkOverride 30 "Monaspace Neon Var";
    };
  };

  programs.zsh = {
    initContent = lib.mkOrder 500 ''
      [[ ! $(command -v nix) && -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]] && source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    '';
  };
}
