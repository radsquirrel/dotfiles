function fish_user_key_bindings
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk backward-char force-repaint
    bind --mode visual --sets-mode default jk backward-char force-repaint
    bind --mode default \\s accept-autosuggestion
    bind --mode default \e\cg _navi_copy
    bind --mode insert \e\cg _navi_copy
    bind --mode visual \e\cg _navi_copy
end
