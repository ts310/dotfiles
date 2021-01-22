# vim:set ft=sh :

alias zclear=`rm -f ~/.zshrc.zwc`
alias c='clear'
alias cdd='cd -' # goto last dir cd'ed from
alias cl='clear; l'
alias la="ls -A -l -G -h"
alias lat="la -t"
alias lf='ls -F'
alias ll='ls -l'
alias ls="ls -FG"
alias l.='ls -d .[^.]*'
alias l='ls -lhGt' # -l long listing, most recent first
alias lh="ls -lh"
alias ll='ls -lhG' # -l long listing, human readable, no group info
alias lt='ls -lt' # sort with recently modified first
alias md='mkdir -p'
alias k9="killall -9"
alias tu='top -o cpu' # cpu
alias tm='top -o vsize' # memory
alias ehosts='sudo vim /etc/hosts'
alias newpass='openssl rand -base64 6'
alias less='less -R'
alias vag='vagrant'
alias ctags="$(brew --prefix)/bin/ctags"
alias sha256sum="shasum -a 256"
alias historyall="history -E 1"
alias dk="docker-compose"
alias kb="kubectl"
alias j="just"
alias da="direnv allow"
alias g="git"
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
alias psql="docker run --rm -it --net=host postgres psql"
if [[ -x `which colordiff` ]]; then
  alias diff="colordiff"
fi
