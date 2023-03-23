return {
    {
        "akinsho/bufferline.nvim",
        opts = { options = { separator_style = "slant", mode = "tabs" } },
    },
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        config = function()
            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = {
                            guibg = "#FC56B1",
                            -- guifg = colors.black,
                        },
                        InclineNormalNC = {
                            guifg = "#FC56B1",
                            -- guibg = colors.black,
                        },
                    },
                },
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
            })
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "tamton-aquib/duck.nvim",
        keys = {
            {
                "<leader>DD",
                function()
                    require("duck").hatch("🦆")
                end,
                desc = "Hatch Duck",
            },
            {
                "<leader>DC",
                function()
                    require("duck").cook("🦆")
                end,
                desc = "Cook Duck",
            },
        },
    },
}
