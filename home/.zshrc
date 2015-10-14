source $HOME/.env
source $HOME/.aliases
source $HOME/.zgen_source/zgen.zsh
if ! zgen saved; then
  zgen prezto editor key-bindings 'emacs'
  zgen prezto prompt theme 'steeef'
  zgen prezto
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen save
fi
