precmd() {
  # Put the string "hostname::/full/directory/path" in the title bar:
  echo -ne "\e]2;$PWD\a"

  # Put the parentdir/currentdir in the tab
  echo -ne "\e]1;$PWD:h:t/$PWD:t\a"

  # vcs_info svn requirs english locale
  LANG="en_US.UTF-8" vcs_info
}

set_running_app() {
  printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
}

preexec() {
  set_running_app
}

postexec() {
  set_running_app
}
