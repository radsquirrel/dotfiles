return {
    {
        "andymass/vim-matchup",
        init = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "css",
                "devicetree",
                "fish",
                "gitattributes",
                "gitignore",
                "git_rebase",
                "http",
                "lua",
                "make",
                "meson",
                "php",
                "regex",
                "scss",
                "sql",
                "vim",
            },
            matchup = {
                enable = true,
            },
            highlight = { enable = true },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        },
    },
}
