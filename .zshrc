HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt appendhistory


if [ -f "$HOME/.dot/pre_init" ]; then
    source $HOME/.dot/pre_init
fi

# Keybindings
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

alias vim='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "$HOME/.dot/init" ]] && source "$HOME/.dot/init"

export EDITOR="/usr/bin/vim"

export PATH=$PATH:$HOME/.local/bin:$HOME/.powertools

# Add custom commands

function cheat {
    curl "https://cheat.sh/$1"
}

function pbcopy {
    xclip -sel clipboard
}

if [[ $(uname) == "Darwin" ]]; then
    alias python=/opt/homebrew/bin/python3
    alias python3=/opt/homebrew/bin/python3
fi

eval "$(starship init zsh)"

[[ -s "/home/m/.gvm/scripts/gvm" ]] && source "/home/m/.gvm/scripts/gvm"

if [ -f "$HOME/.dot/post_init" ]; then
    source $HOME/.dot/post_init
fi
