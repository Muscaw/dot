script_dir="$(dirname "${BASH_SOURCE[0]}")"


function update_arch {
    yay -S --needed < $script_dir/packages.list
}
