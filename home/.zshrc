source $HOME/.env
source $HOME/.aliases

source $HOME/.zgen_source/zgen.zsh

if ! zgen saved; then
  zgen prezto editor key-bindings 'emacs'
  zgen prezto prompt theme 'steeef'
  zgen prezto
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto git
  zgen prezto history
  zgen load zsh-users/zsh-completions src
  zgen save
fi

setopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
