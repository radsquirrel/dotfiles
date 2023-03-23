local notes_dir = "~/.local/share/nv-fzf-vim/"
vim.api.nvim_create_user_command("NV", function()
    local as = require("telescope.actions.state")
    require("telescope.builtin").live_grep({
        attach_mappings = function(_, map)
            map("i", "<C-x>", function(_)
                if not as.get_selected_entry() then
                    local path = notes_dir .. as.get_current_line() .. ".md"
                    vim.cmd("edit! " .. vim.fn.fnameescape(path))
                end
            end)
            return true
        end,
        cwd = notes_dir,
        prompt_title = "Search Notes",
    })
end, {})

vim.api.nvim_create_augroup("config_notes", {})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { vim.fn.expand(notes_dir) .. "*" },
    callback = function()
        local dir = vim.fn.expand("%:p:h") .. "/"
        local file = vim.fn.split(vim.fn.expand("%:p"), dir)[1]
        local job = require("plenary.job")
        local add = job:new({
            command = "git",
            args = { "add", dir },
            cwd = notes_dir,
        })
        add:sync()
        local commit = job:new({
            command = "git",
            args = { "commit", "-am", "autocommit: '" .. file .. "'" },
            cwd = notes_dir,
        })
        commit:sync()
    end,
    group = "config_notes",
})
