source "$__fish_config_dir/variables.fish"

# automatically loads plugins under "$fisher_path"
source "$__fish_config_dir/functions/fisher_path.fish"

if status is-interactive
    # Install fisher, if it doesn't exist
    if ! functions --query fisher
        curl --silent --location https://git.io/fisher | source && fisher update
    end

    if status is-login && ! functions --query replay
        echo "replay is not installed, cannot source /etc/profile"
    end
end

if status is-login && functions --query replay
    replay source /etc/profile

    switch "$DESKTOP_SESSION"
        case i3
            if command --query gnome-keyring-daemon
                replay "eval \$(gnome-keyring-daemon --start 2>/dev/null); export SSH_AUTH_SOCK"
            end
    end
end

fish_add_path --global --move /opt/local/libexec/gnubin
fish_add_path --global --move /opt/local/bin
fish_add_path --global --move /opt/local/libexec/llvm-11/bin
fish_add_path --global --move ~/.local/bin

if status is-interactive
    set --global fish_greeting

    if functions --query theme_gruvbox
        theme_gruvbox dark
    end

    if command --query navi
        navi widget fish | source
    end

    if command --query zoxide
        zoxide init fish | source
    end

    abbr --add --global fap fish_add_path

    if command --query git
        abbr --add --global g git
    end
    abbr --add --global l ls
    abbr --add --global v vim
    abbr --add --global vi vim
    abbr --add --global view 'vim -R'
end
