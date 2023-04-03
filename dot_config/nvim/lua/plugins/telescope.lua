return {
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                silent_chdir = false,
                scope_chdir = "win",
                ignore_lsp = { "null-ls" },
            })
            require("telescope").load_extension("projects")
        end,
    },
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            "ahmedkhalf/project.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
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
}
