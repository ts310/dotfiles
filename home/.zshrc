source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen load seletskiy/zsh-zgen-compinit-tweak
  zgen prezto editor key-bindings 'emacs'
  zgen prezto
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto git
  zgen prezto history
  zgen prezto history-substring-search
  zgen prezto autosuggestions
  zgen prezto fasd
  zgen load nojhan/liquidprompt
  zgen load knu/zsh-git-escape-magic
  zgen save
fi

setopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
