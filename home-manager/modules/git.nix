{ personal, ... }:
{
  programs.git = {
    enable = true;
    userName = "${personal.gitUser}";
    userEmail = "${personal.gitEmail}";

    aliases = {
      tree = "log --all --graph --decorate";
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        side-by-side = true;
        features = "rosepine";
      };
    };
  };
}
