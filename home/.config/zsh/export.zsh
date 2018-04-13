# vim:set ft=sh :
export LANG=ja_JP.UTF-8

export EDITOR='vim'
export VISUAL='vim'
export GIT_EDITOR='vim'
export SVN_EDITOR='vim'

if [[ $IS_MAC -eq 1 ]]; then
  # Prevent double file (._) file on OSX
  export COPYFILE_DISABLE=true
fi

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

export GOPATH=$HOME/.go
export JAVA_HOME=$(/usr/libexec/java_home)

export PATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH
export PATH=$PATH:$GOPATH/bin

if which fasd >/dev/null 2>&1; then
  eval "$(fasd --init auto)"
fi

if which direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

export PYTHONSTARTUP=~/.pythonrc
