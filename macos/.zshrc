# Ubuntu like prompt
function custom_prompt {
    local virtualenv_info=""
    if [[ -n $VIRTUAL_ENV ]]; then
        virtualenv_info="%F{cyan}(${VIRTUAL_ENV##*/})%f "
    fi

    if [[ $PWD == $HOME ]]; then
        local shortened_path="~/"
    elif [[ $PWD == $HOME/* ]]; then
        local shortened_path="~${PWD#$HOME}"
    else
        local shortened_path="$PWD"
    fi

    PROMPT="${virtualenv_info}%F{green}%n@%m:%F{blue}${shortened_path}%f%(!.#.$) "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd custom_prompt

# Enable colors
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ls='ls --color=auto'
DISABLE_AUTO_TITLE="true"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
