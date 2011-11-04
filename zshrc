. ~/dotfiles/zsh/config
. ~/dotfiles/zsh/aliases
. ~/dotfiles/zsh/env

# Local configuration
if [ -f ~/.zshrc.local ]
then
  . ~/.zshrc.local
fi
