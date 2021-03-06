# Added for case insensitive autocomplete
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# for Muse (ECG headband)
#export PATH="$PATH:/Applications/Muse"
#export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"

# Terminal Prompt
# Show current Git branch name in bash PS1
# Used PROMPT_COMMAND previously, but it meant that opening new tab in Terminal.app didn't do so in same dir
# See for refs:https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export PS1='(pyenv$(pyenv version-name)) $(__git_ps1 "(%s) "){\t} \u@\h:\w \\$ '

# DISABLED
# added to disallow pip usage unless in virtualenv
#export PIP_REQUIRE_VIRTUALENV=true
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# added to make Octave plot without errors
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

# add brew bins to path
# Note: `/usr/local/bin` will be added twice now, but this is ok
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
