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
export PS1='[$CONDA_DEFAULT_ENV] $(__git_ps1 "(%s) "){\t} \u@\h:\w \\$ '

# DISABLED as using conda now
# added to disallow pip usage unless in virtualenv
#export PIP_REQUIRE_VIRTUALENV=true
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# added to make Octave plot without errors
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

# add brew bins to path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# added by Miniconda3 4.3.21 installer
export PATH="/Users/dbcerigo/miniconda3/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dbcerigo/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dbcerigo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dbcerigo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dbcerigo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
