#
# ~/.bashrc
#

if [ -f "$HOME/.dot/pre_init" ]; then
    source $HOME/.dot/pre_init
fi

alias vim='nvim'
alias lg='lazygit'
alias dc="docker compose"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "$HOME/.dot/init" ]] && source "$HOME/.dot/init"

export EDITOR="/usr/bin/vim"

export PATH=$PATH:$HOME/.local/bin:$HOME/.powertools:$HOME/go/bin

# Add custom commands

function cheat {
    curl "https://cheat.sh/$1"
}

function pbcopy {
    xclip -sel clipboard
}

function list_all_git_repos() {
    EXCLUDED_DIRS=(
        "$HOME/.local"
        "$HOME/.tmux"
        "$HOME/.cache"
        "$HOME/.intellimacs"
        "$HOME/.gvm"
    )
    exclude=""
    for dir in "${EXCLUDED_DIRS[@]}"; do
        exclude+=" -path $dir -prune -o"
    done
    eval "find $HOME $exclude -type d -name '.git' -printf '%P\n'" | sed 's|/\.git$||'
}

function _workspace_completions() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local results=$(list_all_git_repos)
    COMPREPLY=($(compgen -W "$results" -- "$cur"))
}

function workspace {
    folder="$HOME/$1"
    project_name=$(basename $1 | tr "." "_")
    if [ -d $folder ]; then
        if ! tmux has-session -t "$project_name" 2>/dev/null; then
            tmux new-session -d -s "$project_name" -c "$folder" -n "nvim"
            tmux send-keys -t "$project_name:nvim" "vim ." C-m

            tmux new-window -t "$project_name" -n "bash" -c "$folder"
            tmux select-window -t "$project_name:nvim"
        fi
        tmux attach-session -t "$project_name"
    else
        echo "$project_name does not exist"
    fi
}

complete -F _workspace_completions workspace

eval "$(starship init bash)"

[[ -s "/home/m/.gvm/scripts/gvm" ]] && source "/home/m/.gvm/scripts/gvm"

if [ -f "$HOME/.dot/post_init" ]; then
    source $HOME/.dot/post_init
fi
