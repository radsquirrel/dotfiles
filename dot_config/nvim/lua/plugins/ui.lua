return {
    -- floating winbar
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        opts = {
            window = { margin = { vertical = 0, horizontal = 1 } },
            render = function(props)
                local filename = vim.fn.fnamemodify(
                    vim.api.nvim_buf_get_name(props.buf),
                    ":t"
                )
                local icon, color =
                    require("nvim-web-devicons").get_icon_color(filename)
                return { { icon, guifg = color }, { " " }, { filename } }
            end,
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = "s1n7ax/nvim-window-picker",
    },
    {
        "s1n7ax/nvim-window-picker",
        lazy = true,
        config = true,
    },
    {
        "akinsho/bufferline.nvim",
        opts = { options = { separator_style = "slant" } },
    },
}
