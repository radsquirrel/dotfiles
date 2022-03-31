function fish_user_key_bindings
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk backward-char force-repaint
    bind --mode visual --sets-mode default jk backward-char force-repaint
    bind --mode default \\s accept-autosuggestion

    if functions --query pet-select
        bind --mode default \\p pet-select
    end
end
