return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "beautysh",
                "black",
                "cmakelint",
                "gitlint",
                "markdownlint",
                "proselint",
                "shellcheck",
                "shfmt",
                "stylua",
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
                clangd = {},
                dockerls = {},
                esbonio = {},
                html = {},
                marksman = {},
                pyright = {},
                yamlls = {},
                vimls = {},
            },
            setup = {},
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            setup = {
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,
            },
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
