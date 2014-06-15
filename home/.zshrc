ZSH=$HOME/.config/vendor/oh-my-zsh

DISABLE_AUTO_TITLE="false"

plugins=(git rails ruby brew osx node gem npm vundle svn tmuxinator)

source $ZSH/oh-my-zsh.sh

source $HOME/.config/common/.env
source $HOME/.config/common/.aliases

PROMPT='%{$fg[grey]%}[@%m]%{$reset_color%}%{$fg[yellow]%}[%~]%{$reset_color%}%{$fg[magenta]%}$(vcprompt)%{$reset_color%}
%{$fg[green]%}%n%{$reset_color%} %{$fg[grey]%}>%{$reset_color%} '
