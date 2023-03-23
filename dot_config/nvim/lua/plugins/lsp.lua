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
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            vim.list_extend(opts.sources, {
                nls.builtins.code_actions.proselint,
                nls.builtins.diagnostics.cppcheck,
                nls.builtins.diagnostics.gitlint,
                nls.builtins.diagnostics.markdownlint,
                nls.builtins.diagnostics.proselint,
                nls.builtins.diagnostics.rstcheck,
                nls.builtins.diagnostics.vint,
                nls.builtins.formatting.beautysh,
                nls.builtins.formatting.black,
                nls.builtins.formatting.markdownlint,
            })
        end,
    },
}
