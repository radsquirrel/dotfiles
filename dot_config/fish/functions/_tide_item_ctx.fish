function _tide_item_ctx
    switch $context
        case work
            set --export tide_ctx_bg_color $tide_os_bg_color
            set --export tide_ctx_color $tide_os_color
            _tide_print_item ctx 󰒋
        case '*'
            _tide_item_os
    end
end
