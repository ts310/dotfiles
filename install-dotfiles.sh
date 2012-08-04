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
link vim .vim
link gvimrc .gvimrc
link gemrc .gemrc
link vimrc-min  .vimrc
link gitignore .gitignore
link bin .bin
link screenrc .screenrc
link irbrc .irbrc
link tmux.conf .tmux.conf

echo "Updating git submodules"
git submodule init
git submodule update

if [ -e ~/.bin/vcprompt ]
then
  echo "vcprompt command is found"
else
  echo "Please install vcprompt command"
  curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > bin/vcprompt
  chmod +x bin/vcprompt
fi

echo "Done!"
