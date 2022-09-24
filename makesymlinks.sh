#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# NOTE: this script only needs to be run once, once symlinked then of course...
# ...changes to the dotfiles are reflected by the links
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="profile bash_profile bashrc inputrc vimrc gitconfig "
files="${files} gitignore_global git-completion.bash git-prompt.sh "
files="${files} screenrc ipython condarc jupyter vim-spell-en.utf-8.add "
files="${files} ssh/config tmux.conf config/nvim/init.vim"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving $file dotfile from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
