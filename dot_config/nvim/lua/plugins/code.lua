return {
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        "ruifm/gitlinker.nvim",
        config = function()
            local statusOk, gitlinker = pcall(require, "local.gitlinker")
            local callbacks = {}
            if statusOk then
                callbacks = {
                    [gitlinker.host] = gitlinker.hostType,
                }
            end
            require("gitlinker").setup({ callbacks = callbacks })
        end,
    },
    { "tpope/vim-fugitive" },
    { "tpope/vim-sleuth" },
    {
        "simrat39/symbols-outline.nvim",
        keys = {
            {
                "<leader>cs",
                "<cmd>SymbolsOutline<cr>",
                desc = "Symbols Outline",
            },
        },
        config = true,
    },
    {
        "danymat/neogen",
        keys = {
            {
                "<leader>cc",
                function()
                    require("neogen").generate({})
                end,
                desc = "Neogen Comment",
            },
        },
        opts = { snippet_engine = "luasnip" },
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = true,
    },
}
