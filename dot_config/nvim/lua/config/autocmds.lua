-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_augroup("init_lua", {})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "Jenkinsfile" },
  callback = function()
    vim.opt_local.filetype = "groovy"
  end,
  group = "init_lua",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rst" },
  callback = function()
    vim.wo.spell = true
  end,
  group = "init_lua",
})
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
