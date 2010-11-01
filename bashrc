# Symlink to this file from ~/.bashrc

. ~/dotfiles/bash/env
. ~/dotfiles/bash/config
. ~/dotfiles/bash/aliases

# Bash completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

. ~/dotfiles/lib/git-flow-completion/git-flow-completion.bash
