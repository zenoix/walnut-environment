{
  pkgs,
  lib,
  work,
  ...
}:
{
  imports = [
    ./../common/home.nix
    ./../workCommon/home.nix
  ];

  home = {
    homeDirectory = "/Users/${work.user}";

    file = {
      ".config/aerospace/aerospace.toml".source = ../../nonNix/aerospace.toml;
      ".hushlogin".text = "";
    };

    sessionPath = [
      "$HOME/.npm-global/bin"
    ];

    packages = with pkgs; [
      coreutils
      nodejs
    ];
  };

  walnutHome = {
    awscli.enable = true;
    firefox.enable = true;
    jujutsu.enable = true;
    spicetify.enable = true;
    tmux.sessionizerDirectories = [
      "~/"
      "~/repos"
    ];
  };

  stylix.opacity.terminal = lib.mkForce 0.97;

  programs.zsh = {
    initContent = lib.mkOrder 500 ''
      [[ ! $(command -v nix) && -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]] && source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    '';
  };

  programs.ghostty = {
    package = lib.mkForce null;
    installBatSyntax = lib.mkForce false;
    installVimSyntax = lib.mkForce false;
    settings = {
      font-size = 12;
    };
  };

  xdg.mimeApps = {
    enable = lib.mkForce false;
  };
}
