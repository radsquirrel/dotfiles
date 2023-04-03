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
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "jvgrootveld/telescope-zoxide",
            config = function()
                require("telescope").load_extension("zoxide")
            end,
        },
        keys = {
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
    },
}
