vim.api.nvim_create_augroup("init_lua", {})
vim.api.nvim_create_autocmd(
    -- Add format option 'w' to add trailing white space, indicating that paragraph
    -- continues on next line. This is to be used with mutt's 'text_flowed' option.
    { "FileType" },
    {
        pattern = { "mail" },
        callback = function()
            vim.opt_local.formatoptions:append("w")
        end,
        group = "init_lua",
    }
)
vim.api.nvim_create_autocmd("BufWritePre", {
    -- create directories when needed, when saving a file
    group = "init_lua",
    callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match

        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        local backup = vim.fn.fnamemodify(file, ":p:~:h")
        backup = backup:gsub("[/\\]", "%%")
        vim.go.backupext = backup
    end,
})
if os.getenv("TMUX") ~= nil then
    vim.api.nvim_create_autocmd({ "VimLeave" }, {
        callback = function()
            local job = require("plenary.job")
            local restore = job:new({
                command = "tmux",
                args = {
                    "set-window",
                    "automatic-rename",
                    "on",
                },
            })
            restore:sync()
        end,
        group = "init_lua",
    })
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        callback = function(opts)
            if opts.file ~= "" then
                local job = require("plenary.job")
                local set_rename = job:new({
                    command = "tmux",
                    args = {
                        "rename-window",
                        vim.fs.basename(opts.file),
                    },
                })
                set_rename:sync()
            end
        end,
        group = "init_lua",
    })
end
