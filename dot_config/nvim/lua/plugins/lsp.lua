return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "beautysh",
                "codespell",
                "cspell",
                "gitlint",
                "proselint",
                "rstcheck",
                "shellcheck",
                "stylua",
                "systemdlint",
                "vint",
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            diagnostics = {
                virtual_text = false,
            },
            ---@type lspconfig.options
            servers = {
                bashls = {},
                esbonio = {},
                html = {},
                vimls = {},
            },
            setup = {},
        },
    },
    {
        "mfussenegger/nvim-lint",
        linters_by_ft = {
            cpp = { "cppcheck" },
            fish = { "fish" },
        },
    },
}
