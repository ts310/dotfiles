# Set prompt
autoload -Uz colors
colors
setopt prompt_subst
PROMPT='%{$fg[green]%}[%n]%{$reset_color%} '
RPROMPT='%{$fg[yellow]%}[%~] %{$reset_color%}%{$fg[magenta]%}$(vcprompt)%{$reset_color%}%{$fg[red]%}[%m]%{$reset_color%}'

source ~/dotfiles/common/env
source ~/dotfiles/common/aliases

# Automatically cd to given directory
setopt auto_cd

# Remember cd'ed directory
setopt auto_pushd

# Show packed list for completion
setopt list_packed

# Correct
setopt correct
setopt correctall
setopt nolistbeep

# Command history
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
REPORTTIME=10 # Show elapsed time if command took more than X seconds
LISTMAX=0 # ask to complete if top of list would scroll off screen
setopt hist_ignore_dups  # ignore duplication command history list
setopt share_history     # share command history data
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY    # write history only when closing
setopt EXTENDED_HISTORY  # add more info

# Make CTRL-W delete after other chars, not just spaces
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}

# Quote pasted URLs
autoload url-quote-magic
zle -N self-insert url-quote-magic

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Bind emacs like keys
bindkey -e

# Completions
autoload -Uz compinit
compinit

# Case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''

# Show command and path for screen window title
precmd () {
  if [[ "$TERM" = "screen" ]]; then
    local SHORTPWD="`basename $PWD`"
    echo -ne "\ek${SHORTPWD}/\e\\"
  fi
}
preexec () {
  if [[ "$TERM" = "screen" ]]; then
    local CMD="${1}"
    if [[ ${#CMD} -ge 15 ]]; then
      CMD="${${(z)CMD}[1]} …"
    fi
    echo -ne "\ek${CMD}\e\\"
  fi
}
