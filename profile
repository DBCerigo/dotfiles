# Added for case insensitive autocomplete
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# for Muse (ECG headband)
#export PATH="$PATH:/Applications/Muse"
#export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"

# Show current Git branch name in bash PS1
source ~/.git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# added to disallow pip usage unless in virtualenv
export PIP_REQUIRE_VIRTUALENV=true
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# added to make Octave plot without errors
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

# add brew bins to path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
