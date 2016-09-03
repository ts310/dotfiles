#zmodload zsh/zprof && zprof

source $HOME/.env
source $HOME/.aliases

source $HOME/.zgen_source/zgen.zsh

if ! zgen saved; then
  zgen prezto editor key-bindings 'emacs'
  zgen prezto
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto git
  zgen prezto history
  zgen prezto history-substring-search
  zgen prezto autosuggestions
  zgen prezto fasd
  zgen load zsh-users/zsh-completions src
  zgen load nojhan/liquidprompt
  zgen save
fi

setopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if (which zprof > /dev/null) ;then
  zprof | less
fi
