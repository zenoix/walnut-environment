{ lib, config, ... }:
{
  options = {
    walnutHome.aliases.enable = lib.mkEnableOption "enable shell aliases";
  };

  config = lib.mkIf config.walnutHome.aliases.enable {
    home.shellAliases =
      let
        flakeDir = "~/walnut-environment";
      in
      {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}#$(hostname)";
        rbs = "nixos-rebuild switch --flake ${flakeDir}#walnut-server --build-host walnut@walnut-server --target-host walnut@walnut-server --use-remote-sudo";
        upd = "nix flake update --flake ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

        hms = "home-manager switch --flake ${flakeDir}";
        hmss = "ssh walnut@walnut-server 'cd ~/walnut-environment && git pull &> /dev/null && home-manager switch --flake .'";

        drs = "sudo darwin-rebuild switch --flake ${flakeDir}";

        # Best alias ever
        please = "sudo !!";
        pls = "sudo !!";

        ".." = "cd ..";
        cat = "bat";
        cls = "clear";
        cogco = "cog commit";
        egrep = "grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
        ff = "fastfetch";
        fgrep = "grep -F --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
        fman = "compgen -c | fzf | xargs man";
        frm = "fd . -H | fzf -m --header 'Select files to move with tab then enter' --preview 'bat --style=numbers --color=always {}' | awk '{print $2}' | xargs -r rm";
        g = "git";
        ga = "git add --verbose";
        gap = "git add --verbose --patch";
        gb = "git branch";
        gba = "git branch --all";
        gbD = "git branch --delete --force";
        gbd = "git branch --delete";
        gbl = "git blame -w";
        gbm = "git branch --move";
        gbr = "git branch --remote";
        gbs = "git bisect";
        gbsb = "git bisect bad";
        gbsg = "git bisect good";
        gbsn = "git bisect new";
        gbso = "git bisect old";
        gbsr = "git bisect reset";
        gbss = "git bisect start";
        gc = "git commit --verbose";
        "gc!" = "git commit --verbose --amend";
        gcb = "git checkout -b";
        gcd = "git checkout $(git_develop_branch)";
        gcl = "git clone --recurse-submodules";
        gclean = "git clean --interactive -d";
        gcm = "git checkout $(git_main_branch)";
        gcmsg = "git commit --message";
        "gcn!" = "git commit --verbose --no-edit --amend";
        gco = "git checkout";
        gcor = "git checkout --recurse-submodules";
        gcp = "git cherry-pick";
        gcpa = "git cherry-pick --abort";
        gcpc = "git cherry-pick --continue";
        gd = "git diff";
        gdca = "git diff --cached";
        gdup = "git diff @{upstream}";
        gf = "git fetch";
        gfo = "git fetch origin";
        ggpull = "git pull origin \"$(git_current_branch)\"";
        ggpush = "git push origin \"$(git_current_branch)\"";
        ggsup = "git branch --set-upstream-to=origin/$(git_current_branch)";
        gu = "git pull";
        gl = "git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an - %ar%C(auto) %d%n%s%n'";
        glp = "git log --patch";
        glo = "git log --oneline --decorate";
        gls = "git log --all --graph --stat --pretty=format:'%C(magenta)%h %C(white) %an - %ar%C(auto) %d%n%s%n'";
        glom = "git pull origin $(git_main_branch)";
        gm = "git merge";
        gma = "git merge --abort";
        gmc = "git merge --continue";
        gmom = "git merge origin/$(git_main_branch)";
        gms = "git merge --squash";
        gp = "git push";
        gpf = "git push --force-with-lease --force-if-includes";
        gur = "git pull --rebase -v";
        gurom = "git pull --rebase origin $(git_main_branch)";
        guromi = "git pull --rebase=interactive origin $(git_main_branch)";
        gpsup = "git push --set-upstream origin $(git_current_branch)";
        gpu = "git push origin";
        gr = "git remote";
        gra = "git remote add";
        grb = "git rebase";
        grba = "git rebase --abort";
        grbc = "git rebase --continue";
        grbi = "git rebase --interactive";
        grbm = "git rebase $(git_main_branch)";
        grbom = "git rebase origin/$(git_main_branch)";
        grbs = "git rebase --skip";
        grep = "grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
        grs = "git restore";
        grst = "git restore --staged";
        grup = "git remote update";
        grv = "git remote --verbose";
        gsh = "git show";
        gsps = "git show --pretty=short --show-signature";
        gss = "git status --short";
        gst = "git status";
        gsta = "git stash push";
        gstaa = "git stash apply";
        gstall = "git stash --all";
        gstc = "git stash clear";
        gstd = "git stash drop";
        gstl = "git stash list";
        gstp = "git stash pop";
        gsts = "git stash show --patch";
        gsu = "git submodule update";
        gwt = "git worktree";
        gwta = "git worktree add";
        gwtls = "git worktree list";
        gwtmv = "git worktree move";
        gwtrm = "git worktree remove";
        gcc = "gcc -pedantic-errors";
        "g++" = "g++ -pedantic-errors";
        l = "ls -lah --group-directories-first";
        la = "ls -lAh --group-directories-first";
        ll = "ls -lh --group-directories-first";
        ls = "ls -x --color=tty --group-directories-first";
        lsa = "ls -lah --group-directories-first";
        mkdir = "mkdir -p";
        python = "python3";
        type = "type -a";
        wal = "cd ${flakeDir}";
      };
  };
}
