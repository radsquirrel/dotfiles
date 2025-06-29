function add_paths
    fish_add_path --global --move /opt/local/libexec/gnubin
    fish_add_path --global --move /opt/local/bin
    fish_add_path --global --move /opt/local/libexec/llvm-11/bin
    fish_add_path --global --move /usr/lib/ccache
    fish_add_path --global --move "$WEZTERM_EXECUTABLE_DIR"
    fish_add_path --global --move ~/.local/bin
end

set fisher_path "$__fish_config_dir/plugins"

set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block blink
set fish_cursor_unknown block blink
set fish_vi_force_cursor
set grc_plugin_ignore_execs ls

# add non-standard paths before searching for commands
add_paths

if command --query nvim
    set --export EDITOR nvim
    set --export MANPAGER "nvim +Man!"
else if command --query vim
    set --export EDITOR vim
    set --export MANPAGER "vim -M +MANPAGER -"
end
set --export VISUAL $EDITOR
set --export FZF_DEFAULT_OPTS '--prompt=🔍' '--pointer=▶' '--marker=✓' '--layout=reverse'

set fzf_dir_opts '--border=rounded' \
    '--bind=ctrl-o:execute-silent(open {} &> /dev/tty 2>&1),ctrl-e:execute(vim {} &> /dev/tty 2>&1)'
set fzf_processes_opts '--border=rounded' '--bind=ctrl-k:execute(kill {1})'

if command --query exa
    set --export fzf_preview_dir_cmd command exa --all --long --header \
        --sort newest --color=always --icons
else
    set --export fzf_preview_dir_cmd command ls --format=long --color=auto \
        --human-readable --sort=time --reverse
end

# automatically loads plugins under "$fisher_path"
source "$__fish_config_dir/fisher_path.fish"

if status is-interactive
    # Install fisher, if it doesn't exist
    if ! functions --query fisher
        curl --silent --location https://git.io/fisher | source \
            && fisher install jorgebucaran/fisher \
            && fisher update
    end

    if status is-login && ! functions --query replay
        echo "replay is not installed, cannot source /etc/profile" >&2
    end
end

if status is-login && functions --query replay
    replay source /etc/profile
end

add_paths

if status is-interactive
    set --global fish_greeting

    if test -d $HOME/.config/base16-shell/
        set BASE16_SHELL "$HOME/.config/base16-shell/"
        source "$BASE16_SHELL/profile_helper.fish"
        if not test -f $HOME/.base16_theme
            base16-gruvbox-dark-medium
        end
    else if functions --query theme_gruvbox
        theme_gruvbox dark
    end

    if [ $TERM = linux ]
        fish_config prompt choose default
    end

    if command --query navi
        navi widget fish | source
        bind --mode default --sets-mode insert \cg _navi_smart_replace
        bind --mode visual --sets-mode insert \cg _navi_smart_replace
    end
    if command --query atuin
        set -gx ATUIN_NOBIND true
        atuin init fish | source
        bind --mode default \cr _atuin_search
        bind --mode insert \cr _atuin_search
    end

    if command --query zoxide
        zoxide init fish | source
    end

    abbr --add --global fap fish_add_path
    abbr --add --global --position anywhere strace strace -s 128 -T -tt -y -Y -f

    if command --query task
        abbr --add --global t task
        abbr --add --global ta task add
        abbr --add --global tm task modify
        abbr --add --global tn task annotate
    end

    if command --query git
        abbr --add --global g git
    end
    if command --query navi
        abbr --add --global n navi
    end
    abbr --add --global l ls
    abbr --add --global v vim
    abbr --add --global vi vim
    abbr --add --global view 'vim -R'

    if command --query nvim
        function vim --wraps nvim
            command nvim $argv
        end
    end

    if command --query cowsay
        date +"It's %l:%M%P" | cowsay
    end
end
