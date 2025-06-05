{
  lib,
  server,
  ...
}:
{
  imports = [ ./../common/home.nix ];

  home = {
    username = "${server.user}";
    homeDirectory = "/home/${server.user}";

    sessionVariables = {
      TERM = "xterm-256color";
    };
  };

  walnut-home = {
    devbox.enable = lib.mkForce false;
    devenv.enable = lib.mkForce false;
    direnv.enable = lib.mkForce false;
    fastfetch.enable = lib.mkForce false;
    gh.enable = lib.mkForce false;
    ghostty.enable = lib.mkForce false;
    ruff.enable = lib.mkForce false;
    yazi.enable = lib.mkForce false;
    zoxide.enable = lib.mkForce false;
  };

  programs.zsh = {
    autosuggestion.enable = lib.mkForce false;
  };
}
