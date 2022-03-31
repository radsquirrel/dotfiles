function pet --wraps pet
    switch $argv[1]
        case search exec
            set --append argv --color
    end
    switch $TERM
        case tmux-256color
            set --export TERM xterm-256color
    end
    command pet $argv
end
