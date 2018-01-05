# vim:set ft=sh :

export LANG=ja_JP.UTF-8

export EDITOR='vim'
export VISUAL='vim'
export GIT_EDITOR='vim'
export SVN_EDITOR='vim'

if [[ $IS_MAC -eq 1 ]]; then
  # Prevent double file (._) file on OSX
  export COPYFILE_DISABLE=true

  # Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
  # if [ -x /usr/libexec/path_helper ]; then
  #   PATH=''
  #   eval `/usr/libexec/path_helper -s`
  # fi
fi

export GOPATH=$HOME/.go
export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH
# export PATH=$HOME/pear:$PATH
# export PATH=$PATH:$HOME/.bin
# export PATH=$PATH:$GOPATH/bin

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

if which fasd >/dev/null 2>&1; then
  eval "$(fasd --init auto)"
fi

if [ -d "$HOME/.nodebrew/current/bin" ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

if which direnv > /dev/null 2>&1; then
  #eval "$(direnv hook zsh)"
fi

if which pyenv > /dev/null 2>&1; then
  #eval "$(pyenv init -)"
fi

if [ -d $HOME/Library/Android/sdk/platform-tools ]; then
  #export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
fi
