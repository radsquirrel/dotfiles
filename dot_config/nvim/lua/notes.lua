local notes = {}

notes.dir = "~/.local/share/nv-fzf-vim/"

function notes.create_file()
    local as = require("telescope.actions.state")
    if not as.get_selected_entry() then
        local path = notes.dir .. as.get_current_line() .. ".md"
        vim.cmd("edit! " .. vim.fn.fnameescape(path))
    end
end

return notes
