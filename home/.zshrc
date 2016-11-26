source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen load seletskiy/zsh-zgen-compinit-tweak

  zgen prezto editor key-bindings 'emacs'
  zgen prezto tmux:auto-start local 'yes'
  zgen prezto '*:*' color 'yes'

  zgen prezto

  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto tmux
  zgen prezto git
  zgen prezto history
  zgen prezto history-substring-search
  zgen prezto autosuggestions
  zgen prezto fasd

  zgen load nojhan/liquidprompt
  zgen load knu/zsh-git-escape-magic
  zgen load TBSliver/zsh-plugin-colored-man
  zgen load mafredri/zsh-async

  zgen save
fi

setopt share_history

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
