#zmodload zsh/zprof && zprof

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
  zgen prezto autosuggestions
  zgen load zsh-users/zsh-completions src
  zgen save
fi

setopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (which zprof > /dev/null) ;then
  zprof | less
fi
