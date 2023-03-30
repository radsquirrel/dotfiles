local z_utils = require("telescope._extensions.zoxide.utils")
vim.api.nvim_create_user_command("TCD", function()
    require("telescope").extensions.zoxide.list({
        prompt_title = "[ Change Tab Directory ]",
        mappings = {
            default = {
                action = z_utils.create_basic_command("tcd"),
            },
        },
    })
end, {})

vim.api.nvim_create_user_command("WCD", function()
    require("telescope").extensions.zoxide.list({
        prompt_title = "[ Change Window Directory ]",
        mappings = {
            default = {
                action = z_utils.create_basic_command("lcd"),
            },
        },
    })
end, {})
