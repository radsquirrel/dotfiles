return {
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
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
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
