#!/bin/bash

echo "Configuring git..."

name=$1

if [ "${name}" ]; then
  git config --global user.name "${name}"
fi

email=$2

if [ "${email}" ]; then
  git config --global user.email "${email}"
fi

git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
 
git config --global alias.st status
git config --global alias.cu commit
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.df diff
git config --global alias.ui update-index

git config --global core.excludesfile ~/.gitignore
git config --global core.filemode false

# format="%Cred%h%Creset -%C(yellow)%d%Creset %f %Cgreen(%cr)%Creset by %Cblue%cn"
# git config --global alias.log log --graph --pretty=format:$(printf '%q', $format) --abbrev-commit --date=relative

echo "Done"

git config --list
