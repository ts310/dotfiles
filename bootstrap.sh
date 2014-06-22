#!/usr/bin/env bash

function link() {
  source=$(PWD)/home/$1
  dotfile=$HOME/$1

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

echo "Symlink dotfiles..."

link .bin
link .vim
link .gemrc
link .vimrc
link .gvimrc
link .gitignore
link .irbrc
link .tmux.conf
link .ctags
link .rspec
link .pryrc
link .tigrc
link .zpreztorc

echo "Done!"
