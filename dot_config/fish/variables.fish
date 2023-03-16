set fisher_path "$__fish_config_dir/plugins"

set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block blink
set fish_cursor_unknown block blink
set fish_vi_force_cursor

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
