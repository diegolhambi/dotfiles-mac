autoload -Uz compinit; compinit -u

export PATH="/usr/local/opt/python@3.10/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

source /usr/local/opt/zinit/zinit.zsh

zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh

zinit ice wait lucid
zinit snippet OMZP::git/git.plugin.zsh

zinit ice wait lucid
zinit snippet OMZP::composer/composer.plugin.zsh

zinit ice wait lucid
zinit load zsh-users/zsh-syntax-highlighting

zinit light spaceship-prompt/spaceship-prompt

SPACESHIP_GIT_STATUS_STASHED=""

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

source ~/.work.zshrc
