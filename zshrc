########################################################
# oh-my-zsh settings
########################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/lib/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby brew pip osx node gem npm vundle svn rbenv tmuxinator)

source $ZSH/oh-my-zsh.sh

########################################################
# Customize to your needs...
########################################################

source $HOME/dotfiles/common/env
source $HOME/dotfiles/common/aliases

#autoload -Uz colors
#colors

#setopt prompt_subst
PROMPT='%{$fg[green]%}[%n]%{$reset_color%} '
RPROMPT='%{$fg[yellow]%}[%~] %{$reset_color%}%{$fg[magenta]%}$(vcprompt)%{$reset_color%}%{$fg[red]%}[@%m]%{$reset_color%}'

#setopt auto_cd
#setopt auto_pushd
#setopt list_packed
#setopt correct
#setopt correctall
#setopt nolistbeep

#HISTFILE=~/.zsh_history
#SAVEHIST=10000
#HISTSIZE=10000
#REPORTTIME=10  Show elapsed time if command took more than X seconds
#LISTMAX=0  ask to complete if top of list would scroll off screen
#setopt hist_ignore_dups   ignore duplication command history list
#setopt share_history      share command history data
#setopt HIST_IGNORE_SPACE
#setopt APPEND_HISTORY     write history only when closing
#setopt EXTENDED_HISTORY   add more info

#WORDCHARS=${WORDCHARS//[&=\/;\!%\{]}

#autoload url-quote-magic
#zle -N self-insert url-quote-magic

#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end

#bindkey -e

#autoload -Uz compinit
#compinit

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*' list-colors ''

#. /usr/local/etc/profile.d/z.sh
#function _z_precmd {
  #z --add "$(pwd -P)" 61
#}
#precmd_functions=($precmd_functions _z_precmd)

#precmd () {
  #if [[ "$TERM" = "screen" ]]; then
    #local SHORTPWD="`basename $PWD`"
    #echo -ne "\ek${SHORTPWD}/\e\\"
  #fi
#}

#preexec () {
  #if [[ "$TERM" = "screen" ]]; then
    #local CMD="${1}"
    #if [[ ${CMD} -ge 15 ]]; then
      #CMD="${${(z)CMD}[1]} …"
    #fi
    #echo -ne "\ek${CMD}\e\\"
  #fi
#}
