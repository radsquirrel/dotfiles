set fisher_path "$__fish_config_dir/plugins"

set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block blink
set fish_cursor_unknown block blink
set fish_vi_force_cursor

set Z_DATA "$Z_DATA_DIR/data-"(id --user --name)
if command --query nvim
    set --export EDITOR nvim
    set --export MANPAGER "nvim +Man!"
else if command --query vim
    set --export EDITOR vim
    set --export MANPAGER "vim -M +MANPAGER -"
end
set --export VISUAL $EDITOR
set --export FZF_DEFAULT_OPTS "
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"
