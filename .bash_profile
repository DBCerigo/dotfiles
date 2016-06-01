alias g='git'

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

source ~/.git-completion.bash

# added by Anaconda 2.1.0 installer
export PATH="//anaconda/bin:$PATH"

# added to make Octave plot without errors
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

# attempting to add aliases
# alias for opening ipython notebook in Python Files
alias ipnb='cd /Users/Cerigo/Dropbox/IV/Project/Output/Python\ Files; ipython notebook'

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Show current Git branch name in bash PS1
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
