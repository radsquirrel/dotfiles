# Heavily inspired by https://sunaku.github.io/tmux-yank-osc52.html

function yank
    read --function --null input

    if command --query xhost && xhost >/dev/null 2>&1 && test -n "$DISPLAY"
        if command --query xsel
            printf "%s" "$input" | xsel -i -b
        else if command --query xclip
            printf "%s" "$input" | xclip -sel c
        end
    end

    if command --query tmux && test -n "$TMUX"
        printf "%s" "$input" | tmux load-buffer -
    end

    # 74994 is the max ocs52 length
    printf "%s" "$input" | read --function --null --nchars 74994 input
    set --function encoded (printf "%s" "$input" | base64 | tr -d '\r\n')
    set --function escaped "\033]52;c;$encoded\a"
    if test -n "$TMUX"
        printf "\033Ptmux;\033$escaped\033\\"
    else
        printf "$escaped"
    end
end
