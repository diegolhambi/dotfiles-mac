autoload -Uz compinit; compinit -u

source $(brew --prefix)/opt/zinit/zinit.zsh

zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh

zinit snippet OMZP::git/git.plugin.zsh

zinit ice wait
zinit light zsh-users/zsh-syntax-highlighting

zinit light spaceship-prompt/spaceship-prompt

SPACESHIP_GIT_STATUS_STASHED=""
spaceship remove gcloud

autoload -U zcalc
function __calc_plugin {
    zcalc -f -e "$*"
}
aliases[calc]='noglob __calc_plugin'

cdp() {
    cd "$HOME/Projects/$1"
}

_cdp() {
    ((CURRENT == 2)) &&
    _files -/ -W "$HOME/Projects"
}

compdef _cdp cdp

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

source ~/.work.zshrc
