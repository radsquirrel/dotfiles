function fish_user_key_bindings
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk backward-char force-repaint
    bind --mode visual --sets-mode default jk backward-char force-repaint
    bind --mode default \cy accept-autosuggestion
    bind --mode insert \cy accept-autosuggestion
end
