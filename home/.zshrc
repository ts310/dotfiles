source $HOME/.config/zsh/checks.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/setopt.zsh
source $HOME/.config/zsh/colors.zsh
source $HOME/.config/zsh/bindkeys.zsh
source $HOME/.config/zsh/completion.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/history.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/git.zsh
source $HOME/.config/zsh/zsh_hooks.zsh
source $HOME/.config/zsh/prompt.zsh
source $HOME/.config/zsh/export.zsh
source $HOME/.config/zsh/anyenv.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi
