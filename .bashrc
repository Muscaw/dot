#
# ~/.bashrc
#

if [ -f "$HOME/.dot/pre_init" ]; then
    source $HOME/.dot/pre_init
fi

alias vim='nvim'
alias lg='lazygit'

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

eval "$(starship init bash)"

[[ -s "/home/m/.gvm/scripts/gvm" ]] && source "/home/m/.gvm/scripts/gvm"

if [ -f "$HOME/.dot/post_init" ]; then
    source $HOME/.dot/post_init
fi
