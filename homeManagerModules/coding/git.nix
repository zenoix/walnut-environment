{
  personal,
  lib,
  config,
  ...
}:
{
  options = {
    walnutHome.git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.walnutHome.git.enable {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "${personal.gitUser}";
          email = "${personal.gitEmail}";
        };

        aliases = {
          tree = "log --all --graph --decorate";
        };
        branch = {
          sort = "-committerdate";
        };

        core = {
          whitespace = "error";
        };

        init.defaultBranch = "main";

        log = {
          abbreCommit = true;
          graphColors = "blue,yellow,cyan,magenta,green,red";
        };

        merge = {
          conflictstyle = "zdiff3";
          ff = "only";
        };

        push = {
          autoSetupRemote = true;
          default = "current";
        };

        pull = {
          default = "current";
          rebase = true;
        };

        rebase = {
          autoStash = true;
          missingCommitsCheck = "warn";
        };

        status = {
          branch = true;
          showStash = true;
          showUntrackedFiles = "all";
        };

        tag = {
          sort = "-taggerdate";
        };

        url = {
          "git@github.com:zenoix/" = {
            insteadOf = "z:";
          };
          "git@github.com:" = {
            insteadOf = "gh:";
          };
          "https://github.com/zenoix/" = {
            insteadOf = "zh:";
          };

          "https://github.com/" = {
            insteadOf = "ghh:";
          };
        };

        color = {
          branch = {
            current = "magenta";
            local = "default";
            remote = "yellow";
            upstream = "green";
            plain = "blue";
          };

          "decorate" = {
            HEAD = "red";
            branch = "blue";
            tag = "yellow";
            remoteBranch = "magenta";
          };
        };

      };

    };

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        navigate = true;
        side-by-side = true;
      };
    };
  };
}
