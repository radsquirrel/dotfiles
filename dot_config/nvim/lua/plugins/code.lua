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
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "radsqirrel/cmp-jira",
                dev = true,
                config = true,
            },
            {
                "mtoohey31/cmp-fish",
            },
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
                { name = "cmp_jira" },
                { name = "fish" },
            }))
        end,
    },
    { "tpope/vim-fugitive", cmd = "Git" },
    { "tpope/vim-sleuth", event = "BufReadPre" },
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
        opts = {
            snippet_engine = "luasnip",
            languages = {
                python = {
                    template = {
                        annotation_convention = "reST",
                    },
                },
            },
        },
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = true,
    },
}
