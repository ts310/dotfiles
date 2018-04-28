if [ -z $ZSH_ENV_LOADED ]; then
  #zmodload zsh/zprof && zprof

  source $HOME/.config/zsh/export.zsh
  source $HOME/.config/zsh/anyenv.zsh

  [ -f ~/.zshenv.local ] && source ~/.zshenv.local

  export ZSH_ENV_LOADED="1"
fi
