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
