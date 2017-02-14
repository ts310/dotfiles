source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen load seletskiy/zsh-zgen-compinit-tweak
  zgen load zsh-users/zsh-completions src

  zgen prezto editor key-bindings 'emacs'
  zgen prezto '*:*' color 'yes'
  zgen prezto tmux:auto-start local 'yes'

  zgen prezto

  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto tmux
  zgen prezto git
  zgen prezto history
  zgen prezto history-substring-search
  zgen prezto autosuggestions
  zgen prezto fasd
  zgen prezto ruby

  zgen load nojhan/liquidprompt
  zgen load knu/zsh-git-escape-magic
  zgen load TBSliver/zsh-plugin-colored-man
  zgen load mafredri/zsh-async
  zgen load srijanshetty/docker-zsh
  zgen load supercrabtree/k
  zgen load andrewferrier/fzf-z

  zgen save >/dev/null
fi

export LANG=ja_JP.UTF-8

setopt share_history
setopt print_eight_bit
setopt no_flow_control

zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
