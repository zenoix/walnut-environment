#!/usr/bin/env zsh

# mkcd is equivalent to takedir
function mkcd takedir() {
    mkdir -p $@ && cd ''${@:$#}
}

function takeurl() {
    local data thedir
    data="$(mktemp)"
    curl -L "$1" > "$data"
    tar xf "$data"
    thedir="$(tar tf "$data" | head -n 1)"
    rm "$data"
    cd "$thedir"
}

function takegit() {
    git clone "$1"

    gitAliases=($(git config --list | grep ^url. | sed -e "s/.*insteadof=\(.*\)/\1/"))
    foundGitAlias=""

    for alias in $gitAliases;
    do
        if [[ $1 =~ ^$alias ]] then
            foundGitAlias=$alias
            break
        fi
    done


    if [[ -n $foundGitAlias ]] then
        prefixRemoved=$(echo "$1" | sed -e "s/^$foundGitAlias//")
        cd "$(basename ''${prefixRemoved%%.git})"
    else
        cd "$(basename ''${1%%.git})"
    fi
}

function take() {
    if command -v git >/dev/null 2>&1
    then
        urlAliases=$(git config --list | grep ^url. | sed -e "s/.*insteadof=\(.*\)/\1/" | paste -sd "|" -)

        if [[ -n "$urlAliases" ]]
        then
            gitRegex="^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync|$urlAliases).*\.git/?\$"
        else
            gitRegex="^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?\$"
        fi
    fi

    if [[ $1 =~ ^(https?|ftp).*\.(tar\.(gz|bz2|xz)|tgz)$ ]]; then
        takeurl "$1"
    elif [[ $1 =~ $gitRegex ]]; then
        takegit "$1"
    else
        takedir "$@"
    fi
}

