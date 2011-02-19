if [ -f ~/.bashrc ]
then
	source ~/.bashrc
fi

# use zsh
if [ -f /bin/zsh ]; then
  exec /bin/zsh
fi
