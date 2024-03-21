return {
    {
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
            require("luasnip").setup(opts)
            require("luasnip.loaders.from_lua").lazy_load({
                lazy_paths = { "~/.config/nvim/lua/snippets" },
            })
        end,
        keys = {
            { "<tab>", false },
            { "<s-tab>", false },
            {
                "<C-j>",
                function()
                    if require("luasnip").expand_or_jumpable() then
                        require("luasnip").expand_or_jump()
                    end
                end,
                mode = { "i", "s" },
            },
            {
                "<C-k>",
                function()
                    if require("luasnip").jumpable(-1) then
                        require("luasnip").jump(-1)
                    end
                end,
                mode = { "i", "s" },
            },
            {
                "<C-l>",
                function()
                    if require("luasnip").choice_active() then
                        require("luasnip").change_choice(1)
                    end
                end,
                mode = "i",
            },
        },
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
            {
                "onsails/lspkind.nvim",
            },
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
                { name = "cmp_jira" },
                { name = "fish" },
            }))
            opts.formatting.format = require("lspkind").cmp_format({
                maxwidth = 50,
                mode = "symbol_text",
                menu = {
                    buffer = "[Buffer]",
                    path = "[Path]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    cmp_jira = "[Jira]",
                    fish = "[Fish]",
                },
            })
        end,
    },
    { "tpope/vim-fugitive", cmd = "Git" },
    { "tpope/vim-sleuth", event = "BufReadPre" },
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
