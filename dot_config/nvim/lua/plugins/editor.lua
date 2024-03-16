local make_zoxide = function(title, command)
    return function()
        require("telescope").extensions.zoxide.list({
            prompt_title = title,
            mappings = {
                default = {
                    action = require("telescope._extensions.zoxide.utils").create_basic_command(
                        command
                    ),
                },
            },
        })
    end
end

return {
    { "f4z3r/cheat.vim" },
    { "folke/flash.nvim", enabled = false },
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    -- add folding range to capabilities
    {
        "neovim/nvim-lspconfig",
        opts = {
            capabilities = {
                textDocument = {
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true,
                    },
                },
            },
        },
    },
    -- add nvim-ufo
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        event = "BufReadPost",
        opts = {},

        init = function()
            -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
            vim.keymap.set("n", "zR", function()
                require("ufo").openAllFolds()
            end)
            vim.keymap.set("n", "zM", function()
                require("ufo").closeAllFolds()
            end)
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            {
                "jvgrootveld/telescope-zoxide",
                config = function()
                    require("telescope").load_extension("zoxide")
                end,
            },
        },
        keys = {
            {
                "<leader>fN",
                function()
                    local notes = require("notes")
                    require("telescope.builtin").live_grep({
                        attach_mappings = function(_, map)
                            map("i", "<C-x>", notes.create_file)
                            return true
                        end,
                        cwd = notes.dir,
                        prompt_title = "Find Notes",
                    })
                end,
                desc = "Find Notes",
            },
            {
                "<leader>Zt",
                make_zoxide("[ Change Tab Directory ]", "tcd"),
                desc = "Change Tab Directory",
            },
            {
                "<leader>Zl",
                make_zoxide("[ Change Window Directory ]", "tcd"),
                desc = "Change Window Directory",
            },
            {
                "<leader>Zz",
                make_zoxide("[ Change Global Directory ]", "cd"),
                desc = "Change Global Directory",
            },
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                    },
                },
            },
        },
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
                    require("duck").cook()
                end,
                desc = "Cook Duck",
            },
        },
    },
}
