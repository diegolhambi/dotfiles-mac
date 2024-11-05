if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

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
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PACKAGE_SHOW_PRIVATE=true
spaceship remove gcloud

autoload -U zcalc
function __calc_plugin {
    zcalc -f -e "$*"
}
aliases[calc]='noglob __calc_plugin'

eval "$(zoxide init zsh)"

eval "$(fnm completions --shell zsh)"

export YARN_GLOBAL_FOLDER="$FNM_MULTISHELL_PATH/yarn-global"
export YARN_PREFIX="$FNM_MULTISHELL_PATH"

source ~/.work.zshrc