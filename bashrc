# Terminal Prompt
# Show current Git branch name in bash PS1
# Used PROMPT_COMMAND previously, but it meant that opening new tab in Terminal.app didn't do so in same dir
# See for refs:https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export PS1='(pyenv$(pyenv version-name)) $(__git_ps1 "(%s) "){\t} \u@\h:\w \\$ '

# Added for case insensitive autocomplete
if [[ $- == *i* ]]; then
    bind "set completion-ignore-case on"
    bind "set show-all-if-ambiguous on"
fi

# colour support for OSx and Linux
if ls --version 2>/dev/null | grep -q 'coreutils'; then
    alias ls='ls --color=always'
else
    alias ls='ls -G'
fi

# quick type for cd
alias fd='cd'

# quick make
alias m='make'
alias f='make format'
# annoying metafont
alias mf='make'

# for quick venv
vsa() { source "$@"/bin/activate; }
alias vsv='source .venv/bin/activate'
alias vsd='deactivate'

# for quick port fowarding on 7777 to spark-master
alias spf='ssh -L localhost:7777:localhost:7777 sm'

# GIT SHIT
# https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
alias g='git'
# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g
source ~/.git-completion.bash

# specific for setting up pipe to aws instance for Jupyter Notebook serves
shp () { ssh -L $1:localhost:$1 aws; }

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv (Python version manager; guarded to match the asdf/mise sourcing style)
if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init -)"
fi

# asdf
[ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
# ~/.local/bin holds mise (and other user-local binaries); ensure it's on PATH
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash)"
