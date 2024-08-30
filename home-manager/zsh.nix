{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = 
      let
        flakeDir = "~/walnut-environment";
      in {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "nix flake update ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

        hms = "home-manager switch --flake ${flakeDir}";

        conf = "nvim ${flakeDir}/nixos/configuration.nix";
        pkgs = "nvim ${flakeDir}/nixos/packages.nix";

        ".." = "cd ..";
        cat = "bat";
        cls = "clear";
        egrep = "grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
        fgrep = "grep -F --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
        fman = "compgen -c | fzf | xargs man";
        frm = "fd . -H | fzf -m --header 'Select files to move with tab then enter' --preview 'bat --style=numbers --color=always {}' | awk '{print $2}' | xargs -r rm";
        g = "git";
        ga = "git add";
        gaa = "git add --all";
        gam = "git am";
        gama = "git am --abort";
        gamc = "git am --continue";
        gams = "git am --skip";
        gamscp = "git am --show-current-patch";
        gap = "git apply";
        gapa = "git add --patch";
        gapt = "git apply --3way";
        gau = "git add --update";
        gav = "git add --verbose";
        gb = "git branch";
        gba = "git branch --all";
        gbD = "git branch --delete --force";
        gbd = "git branch --delete";
        gbl = "git blame -w";
        gbm = "git branch --move";
        gbnm = "git branch --no-merged";
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
        gca = "git commit --verbose --all";
        "gca!" = "git commit --verbose --all --amend";
        gcam = "git commit --all --message";
        "gcan!" = "git commit --verbose --all --no-edit --amend";
        "gcann!" = "git commit --verbose --all --date=now --no-edit --amend";
        "gcans!" = "git commit --verbose --all --signoff --no-edit --amend";
        gcas = "git commit --all --signoff";
        gcasm = "git commit --all --signoff --message";
        gcB = "git checkout -B";
        gcb = "git checkout -b";
        gcd = "git checkout $(git_develop_branch)";
        gcf = "git config --list";
        gcl = "git clone --recurse-submodules";
        gclean = "git clean --interactive -d";
        gcm = "git checkout $(git_main_branch)";
        gcmsg = "git commit --message";
        "gcn!" = "git commit --verbose --no-edit --amend";
        gco = "git checkout";
        gcor = "git checkout --recurse-submodules";
        gcount = "git shortlog --summary --numbered";
        gcp = "git cherry-pick";
        gcpa = "git cherry-pick --abort";
        gcpc = "git cherry-pick --continue";
        gcs = "git commit --gpg-sign";
        gcsm = "git commit --signoff --message";
        gcss = "git commit --gpg-sign --signoff";
        gcssm = "git commit --gpg-sign --signoff --message";
        gd = "git diff";
        gdca = "git diff --cached";
        gdct="git describe --tags $(git rev-list --tags --max-count = 1)";
        gdcw = "git diff --cached --word-diff";
        gds = "git diff --staged";
        gdt = "git diff-tree --no-commit-id --name-only -r";
        gdup = "git diff @{upstream}";
        gdw = "git diff --word-diff";
        gf = "git fetch";
        gfa = "git fetch --all --prune --jobs=10";
        gfg = "git ls-files | grep";
        gfo = "git fetch origin";
        gg = "git gui citool";
        gga = "git gui citool --amend";
        ggpull = "git pull origin \"$(git_current_branch)\"";
        ggpur = "ggu";
        ggpush = "git push origin \"$(git_current_branch)\"";
        ggsup = "git branch --set-upstream-to=origin/$(git_current_branch)";
        ghh = "git help";
        gignore = "git update-index --assume-unchanged";
        gignored = "git ls-files -v | grep \"^[[:lower:]]\"";
        git-svn-dcommit-push = "git svn dcommit && git push github $(git_main_branch):svntrunk";
        gk = "\\gitk --all --branches &!";
        gke = "\\gitk --all $(git log --walk-reflogs --pretty=%h) &!";
        gl = "git pull";
        glg = "git log --stat";
        glgg = "git log --graph";
        glgga = "git log --graph --decorate --all";
        glgm = "git log --graph --max-count=10";
        glgp = "git log --stat --patch";
        glo = "git log --oneline --decorate";
        globurl = "noglob urlglobber ";
        glod = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset\"";
        glods = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset\" --date=short";
        glog = "git log --oneline --decorate --graph";
        gloga = "git log --oneline --decorate --graph --all";
        glol = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\"";
        glola = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\" --all";
        glols = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\" --stat";
        glp = "_git_log_prettily";
        gluc = "git pull upstream $(git_current_branch)";
        glum = "git pull upstream $(git_main_branch)";
        gm = "git merge";
        gma = "git merge --abort";
        gmc = "git merge --continue";
        gmom = "git merge origin/$(git_main_branch)";
        gms = "git merge --squash";
        gmtl = "git mergetool --no-prompt";
        gmtlvim = "git mergetool --no-prompt --tool=vimdiff";
        gmum = "git merge upstream/$(git_main_branch)";
        gp = "git push";
        gpd = "git push --dry-run";
        gpf = "git push --force-with-lease --force-if-includes";
        "gpf!" = "git push --force";
        gpoat = "git push origin --all && git push origin --tags";
        gpod = "git push origin --delete";
        gpr = "git pull --rebase";
        gpra = "git pull --rebase --autostash";
        gprav = "git pull --rebase --autostash -v";
        gpristine = "git reset --hard && git clean --force -dfx";
        gprom = "git pull --rebase origin $(git_main_branch)";
        gpromi = "git pull --rebase=interactive origin $(git_main_branch)";
        gprv = "git pull --rebase -v";
        gpsup = "git push --set-upstream origin $(git_current_branch)";
        gpsupf = "git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes";
        gpu = "git push upstream";
        gpv = "git push --verbose";
        gr = "git remote";
        gra = "git remote add";
        grb = "git rebase";
        grba = "git rebase --abort";
        grbc = "git rebase --continue";
        grbd = "git rebase $(git_develop_branch)";
        grbi = "git rebase --interactive";
        grbm = "git rebase $(git_main_branch)";
        grbo = "git rebase --onto";
        grbom = "git rebase origin/$(git_main_branch)";
        grbs = "git rebase --skip";
        grep = "grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
        grev = "git revert";
        greva = "git revert --abort";
        grevc = "git revert --continue";
        grf = "git reflog";
        grh = "git reset";
        grhh = "git reset --hard";
        grhk = "git reset --keep";
        grhs = "git reset --soft";
        grm = "git rm";
        grmc = "git rm --cached";
        grmv = "git remote rename";
        groh = "git reset origin/$(git_current_branch) --hard";
        grrm = "git remote remove";
        grs = "git restore";
        grset = "git remote set-url";
        grss = "git restore --source";
        grst = "git restore --staged";
        grt = "cd \"$(git rev-parse --show-toplevel || echo .)\"";
        gru = "git reset --";
        grup = "git remote update";
        grv = "git remote --verbose";
        gsb = "git status --short --branch";
        gsd = "git svn dcommit";
        gsh = "git show";
        gsi = "git submodule init";
        gsps = "git show --pretty=short --show-signature";
        gsr = "git svn rebase";
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
        gstu = "gsta --include-untracked";
        gsu = "git submodule update";
        gsw = "git switch";
        gswc = "git switch --create";
        gswd = "git switch $(git_develop_branch)";
        gswm = "git switch $(git_main_branch)";
        gta = "git tag --annotate";
        gtl = "gtl(){ git tag --sort=-v:refname -n --list \"\${1}*\" }; noglob gtl";
        gts = "git tag --sign";
        gtv = "git tag | sort -V";
        gunignore = "git update-index --no-assume-unchanged";
        gwch = "git whatchanged -p --abbrev-commit --pretty=medium";
        gwip = "git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message \"--wip-- [skip ci]\"";
        gwipe = "git reset --hard && git clean --force -df";
        gwt = "git worktree";
        gwta = "git worktree add";
        gwtls = "git worktree list";
        gwtmv = "git worktree move";
        gwtrm = "git worktree remove";
        l = "ls -lah --group-directories-first";
        la = "ls -lAh --group-directories-first";
        ll = "ls -lh --group-directories-first";
        ls = "ls -x --color=tty --group-directories-first";
        lsa = "ls -lah --group-directories-first";
        mkdir = "mkdir -p";
        python = "python3";
        type = "type -a";
        which-command = "whence";
      };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
    # Open tmux by default
    if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      exec tmux
    fi

    autoload -Uz is-at-least
    
    function git_current_branch() {
        local ref
        ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
        local ret=$?
        if [[ $ret != 0 ]]; then
            [[ $ret == 128 ]] && return  # no git repo.
            ref=$(git rev-parse --short HEAD 2> /dev/null) || return
        fi
        echo ''${ref#refs/heads/}
    }
    
    function git_current_user_name() {
        __git_prompt_git config user.name 2>/dev/null
    }
    
    function git_current_user_email() {
        __git_prompt_git config user.email 2>/dev/null
    }
    
    function git_repo_name() {
        local repo_path
        if repo_path="$(git rev-parse --show-toplevel 2>/dev/null)" && [[ -n "$repo_path" ]]; then
            echo ''${repo_path:t}
        fi
    }
    
    function current_branch() {
        git_current_branch
    }
    
    function git_develop_branch() {
        command git rev-parse --git-dir &>/dev/null || return
        local branch
        for branch in dev devel develop development; do
            if command git show-ref -q --verify refs/heads/$branch; then
                echo $branch
                return 0
            fi
        done
    
        echo develop
        return 1
    }
    
    function git_main_branch() {
        command git rev-parse --git-dir &>/dev/null || return
        local ref
        for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,master}; do
            if command git show-ref -q --verify $ref; then
                echo ''${ref:t}
                return 0
            fi
        done
    
        echo master
        return 1
    }
    '';
  };
}
