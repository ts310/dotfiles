#!/bin/bash

# installation script for dotfiles
# .bashrc .zshrc .zshenv .inputrc etc...

function link() {
  source=~/dotfiles/$1
  dotfile=~/$2

  # if file exists and isn't a symlink, skip it
  if [ -e "${dotfile}" -a ! "${dotfile}" ]
  then
    echo "${dotfile} already exists"
  else
    if [ -e "${dotfile}" ]
    then 
      echo "Removing ${dotfile}..."
      rm ${dotfile}
    fi
    ln -sfv ${source} ${dotfile}
  fi
}

# symlink various config files

echo "Symlink dotfiles..."

link bash_profile .bash_profile
link bashrc .bashrc
link inputrc .inputrc
link zshrc .zshrc
link vimrc .vimrc
link gvimrc .gvimrc
link gemrc .gemrc
link vim  .vim
link gitignore .gitignore
link bin .bin

# reload source
source ~/.bash_profile

echo "Installing vcprompt command..."
curl http://github.com/xvzf/vcprompt/raw/master/bin/vcprompt > ~/dotfiles/bin/vcprompt
chmod +x ~/.bin/vcprompt

echo "Updating git submodules"
git submodule init
git submodule update

echo "Done!"
