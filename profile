# for Muse (ECG headband)
#export PATH="$PATH:/Applications/Muse"
#export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"

# DISABLED
# added to disallow pip usage unless in virtualenv
#export PIP_REQUIRE_VIRTUALENV=true
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# added to make Octave plot without errors
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
