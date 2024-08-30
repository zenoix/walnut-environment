{
  programs.git = {
    enable = true;
    userName = "zenoix";
    userEmail = "41812358+zenoix@users.noreply.github.com";

    aliases = {
      tree = "log --all --graph --decorate";
    };

    extraConfig = {
      init.defaultBranch = "main";
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
