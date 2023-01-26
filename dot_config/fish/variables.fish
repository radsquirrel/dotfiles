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
set --export FZF_DEFAULT_OPTS "
    --prompt=🔍
    --pointer=▶
    --marker=✓
    --layout=reverse
    --border=rounded
    --height=70%
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"

set fzf_dir_opts '--bind=ctrl-o:execute-silent(open {} &> /dev/tty 2>&1),ctrl-e:execute(vim {} &> /dev/tty 2>&1)'
set fzf_processes_opts '--bind=ctrl-k:execute(kill {1})'

if command --query exa
    set --export fzf_preview_dir_cmd command exa --all --long --header \
        --sort newest --color=always --icons
else
    set --export fzf_preview_dir_cmd command ls --format=long --color=auto \
        --human-readable --sort=time --reverse
end
