# vim:set ft=sh :

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn cvs
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

PROMPT='%{${fg[cyan]}%}%~:%{${reset_color}%} '
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
