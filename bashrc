# colour support for OSx and Linux
if ls --version 2>/dev/null | grep -q 'coreutils'; then
    alias ls='ls --color=always'
else
    alias ls='ls -G'
fi

# quick type for cd
alias fd='cd'

# for quick virtualenv activate
alias vp='source venv/bin/activate'

# GIT SHIT
alias g='git'
# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g
source ~/.git-completion.bash

# alias for opening ipython notebook in Python Files
alias ipnb='cd /Users/Cerigo/Dropbox/IV/Project/Output/Python\ Files; ipython notebook'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
mkcd () {
		  case "$1" in
				      */..|*/../) cd -- "$1";; # that doesn't make any sense unless the directory already exists
					   /*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
				      /*) mkdir -p "$1" && cd "$1";;
				      */../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
					../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
					 *) mkdir -p "./$1" && cd "./$1";;
					   esac
}
