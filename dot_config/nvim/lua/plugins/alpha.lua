return {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
        local button = dashboard.button(
            "p",
            "" .. "  Projects",
            ":Telescope projects <CR>"
        )
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
        local head = vim.list_slice(dashboard.section.buttons.val, 0, 3)
        local tail = vim.list_slice(dashboard.section.buttons.val, 3, 8)
        dashboard.section.buttons.val = head
        vim.list_extend(dashboard.section.buttons.val, { button })
        vim.list_extend(dashboard.section.buttons.val, tail)
    end,
}
