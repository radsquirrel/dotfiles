function sudo --wraps sudo
    switch $TERM
        case tmux-256color
            set -x TERM xterm-256color
    end
    command sudo --preserve-env=HOME,SHELL,EDITOR $argv
end
