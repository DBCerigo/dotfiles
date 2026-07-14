if [ -f ~/.profile ]; then
    . ~/.profile
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# use this file for aliases etc. not to be committed
if [ -f ~/.bashrc_device_specific ]; then
    . ~/.bashrc_device_specific
fi

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
