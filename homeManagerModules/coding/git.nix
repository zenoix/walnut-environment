{
  personal,
  lib,
  config,
  ...
}:
{
  options = {
    walnut-home.git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.walnut-home.git.enable {
    programs.git = {
      enable = true;
      userName = "${personal.gitUser}";
      userEmail = "${personal.gitEmail}";

      aliases = {
        tree = "log --all --graph --decorate";
      };

      extraConfig = {
        branch = {
          sort = "-committerdate";
        };

        core = {
          whitespace = "error";
        };

        init.defaultBranch = "main";

        interactive = {
          diffFilter = "delta --color-only";
        };

        log = {
          abbreCommit = true;
          graphColors = "blue,yellow,cyan,magenta,green,red";
        };

        merge.conflictstyle = "zdiff3";

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
            insteadOf = "z/";
            "git@github.com:" = {
              insteadOf = "gh:";
            };
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

      delta = {
        enable = true;
        options = {
          navigate = true;
          side-by-side = true;
        };
      };
    };
  };
}
