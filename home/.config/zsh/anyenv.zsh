eval "$(anyenv init -)"
# ANYENV_ROOT="$HOME/.anyenv"
# 
# if [ -d $ANYENV_ROOT ]; then
#   export PATH="$HOME/.anyenv/bin:$PATH"
# 
#   for D in `ls $HOME/.anyenv/envs`
#   do
#     export PATH="${HOME}/.anyenv/envs/${D}shims:${PATH}"
#   done
# fi
# 
# function anyenv_init() {
#   eval "$(anyenv init - --no-rehash)"
# }
# 
# function anyenv_unset() {
#   unset -f ndenv
#   unset -f rbenv
#   unset -f pyenv
# }
# 
# function ndenv() {
#   anyenv_unset
#   anyenv_init
#   ndenv "$@"
# }
# 
# function rbenv() {
#   anyenv_unset
#   anyenv_init
#   rbenv "$@"
# }
# 
# function pyenv() {
#   anyenv_unset
#   anyenv_init
#   pyenv "$@"
# }
